package com.revshop.controllers;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.ReviewEntity;
import com.revshop.service.impl.ReviewServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ReviewAddServlet
 */
public class ReviewAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ReviewAddServlet.class); // Logger instance
    private ReviewServiceIMPL reviewService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAddServlet() {
        super();
        this.reviewService = new ReviewServiceIMPL();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doGet() method in ReviewAddServlet");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        logger.debug("Exiting doGet() method in ReviewAddServlet");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in ReviewAddServlet");

        HttpSession session = request.getSession();
        LoginEntity user = (LoginEntity) session.getAttribute("user");

        if (user == null) {
            logger.warn("Unauthenticated user attempted to submit a review.");
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
            return;
        }

        try {
            // Get form data
            String reviewText = request.getParameter("review");
            int stars = Integer.parseInt(request.getParameter("rating"));
            int productId = Integer.parseInt(request.getParameter("product_id"));
            String customerName = request.getParameter("name");
            String customerEmail = request.getParameter("email");
            Date reviewDate = Date.valueOf(LocalDate.now());

            logger.debug("Received review data - Product ID: {}, User: {}, Rating: {}", productId, user.getUserName(), stars);

            // Create ReviewEntity object
            ReviewEntity review = new ReviewEntity();
            review.setReview(reviewText);
            review.setStars(stars);
            review.setProductId(productId);
            review.setUserId(user.getUserId());
            review.setCustomerName(customerName);
            review.setCustomerEmail(customerEmail);
            review.setReviewDate(reviewDate);

            // Save the review using the service
            boolean success = reviewService.addReview(review);

            if (success) {
                logger.info("Review added successfully for product ID: {} by user: {}", productId, user.getUserName());
                response.sendRedirect("ProductDetailsServlet?productId=" + productId); // Redirect to product detail page
            } else {
                logger.error("Failed to add review for product ID: {}", productId);
                response.sendRedirect("error.jsp"); // Redirect to an error page in case of failure
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid input received for product ID or rating.", e);
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            logger.error("An unexpected error occurred while adding a review.", e);
            response.sendRedirect("error.jsp");
        }

        logger.debug("Exiting doPost() method in ReviewAddServlet");
    }
}
