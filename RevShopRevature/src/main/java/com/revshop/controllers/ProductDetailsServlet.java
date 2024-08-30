package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.ProductEntity;
import com.revshop.Entity.ReviewEntity;
import com.revshop.service.ProductService;
import com.revshop.service.ReviewService;
import com.revshop.service.impl.ProductServiceIMPL;
import com.revshop.service.impl.ReviewServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetailsServlet
 */
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ProductDetailsServlet.class);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailsServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdParam = request.getParameter("productId");
        logger.debug("Received productId parameter: {}", productIdParam);

        int productId = 0;
        if (productIdParam != null) {
            try {
                productId = Integer.parseInt(productIdParam);
                logger.debug("Parsed productId: {}", productId);
            } catch (NumberFormatException e) {
                logger.error("Invalid productId format: {}", productIdParam, e);
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
                return;
            }
        }

        ProductService productService = new ProductServiceIMPL();
        ReviewService reviewService = new ReviewServiceIMPL();

        // Retrieve the product details and reviews using the services
        ProductEntity product = productService.getProductById(productId);
        if (product != null) {
            logger.debug("Product found: {}", product.getProductName());
            List<ReviewEntity> reviews = reviewService.getReviewsByProductId(productId);
            logger.debug("Number of reviews found: {}", reviews.size());

            // Set the product and reviews objects in the request attributes
            request.setAttribute("product", product);
            request.setAttribute("reviews", reviews);

            // Forward to the JSP page for rendering
            request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
            logger.debug("Forwarded to product-detail.jsp");
        } else {
            logger.warn("Product not found for productId: {}", productId);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
