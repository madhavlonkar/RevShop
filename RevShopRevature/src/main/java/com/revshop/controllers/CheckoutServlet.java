package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.UserEntity;
import com.revshop.service.impl.CartServiceIMPL;
import com.revshop.service.impl.OrderServiceIMPL;
import com.revshop.service.impl.UserServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckoutServlet
 */
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CheckoutServlet.class);  // Logger instance

	private UserServiceIMPL userService;
    private CartServiceIMPL cartService;
    private OrderServiceIMPL orderService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutServlet() {
		super();
		this.userService = new UserServiceIMPL();
        this.cartService = new CartServiceIMPL();
        this.orderService = new OrderServiceIMPL();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doGet() method in CheckoutServlet");

		HttpSession session = request.getSession();
        LoginEntity loginUser = (LoginEntity) session.getAttribute("user");

        if (loginUser != null) {
			logger.debug("User is logged in: " + loginUser);

            // Fetch user details
            UserEntity userDetails = userService.getUserById(loginUser.getUserId());
            request.setAttribute("userDetails", userDetails);
            logger.debug("Fetched user details: " + userDetails);

            // Fetch cart details
            List<CartEntity> cartItems = cartService.getCart(loginUser.getUserId());
            request.setAttribute("cartItems", cartItems);
            logger.debug("Fetched cart items: " + cartItems);

            request.getRequestDispatcher("checkout.jsp").forward(request, response);
			logger.debug("Forwarded to checkout.jsp");
        } else {
			logger.warn("User is not logged in, redirecting to login page.");
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
        }

		logger.debug("Exiting doGet() method in CheckoutServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doPost() method in CheckoutServlet");

		HttpSession session = request.getSession();
		LoginEntity loginUser = (LoginEntity) session.getAttribute("user");

		if (loginUser != null) {
			logger.debug("User is logged in: " + loginUser);

			// Fetch the current user details
			UserEntity userDetails = userService.getUserById(loginUser.getUserId());
			logger.debug("Fetched user details: " + userDetails);

			// Get the shipping details from the form submission
			String shippingAddress = request.getParameter("address") + ", " +
									 request.getParameter("city") + ", " +
									 request.getParameter("state") + ", " +
									 request.getParameter("zip");
			logger.debug("Shipping address: " + shippingAddress);

			// Get the Razorpay payment ID
			String paymentId = request.getParameter("payment_id");
			logger.debug("Received payment ID: " + paymentId);

			// Place the order
			boolean orderPlaced = orderService.placeOrder(loginUser.getUserId(), paymentId, shippingAddress);
			logger.debug("Order placed status: " + orderPlaced);

			// Redirect to the appropriate page based on the result
			if (orderPlaced) {
				logger.debug("Order placed successfully, redirecting to Success.jsp");
				response.sendRedirect("OtherPages/Success.jsp");
			} else {
				logger.error("Order placement failed, redirecting to Error.jsp");
				response.sendRedirect("OtherPages/Error.jsp");
			}

		} else {
			logger.warn("User is not logged in, redirecting to login page.");
			response.sendRedirect("LoginAndRegistration/user-login.jsp");
		}

		logger.debug("Exiting doPost() method in CheckoutServlet");
	}
}
