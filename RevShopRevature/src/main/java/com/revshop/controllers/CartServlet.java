package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;

import com.revshop.Entity.CartEntity;
import com.revshop.service.CartService;
import com.revshop.service.impl.CartServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CartServlet.class);  // Logger instance

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doGet() method in CartServlet");

		// Get userId from request parameters
		String userIdParam = request.getParameter("userId");
		logger.debug("Received userId parameter: " + userIdParam);
		int userId = 0;

		if (userIdParam != null && !userIdParam.isEmpty()) {
			try {
				userId = Integer.parseInt(userIdParam);
				logger.debug("Parsed userId: " + userId);
			} catch (NumberFormatException e) {
				logger.error("Failed to parse userId", e);
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID.");
				return;
			}
		} else {
			logger.warn("UserId parameter is missing or empty, redirecting to login page.");
			response.sendRedirect("/LoginAndRegistration/user-login.jsp");
			return;
		}

		if (userId > 0) {
			try {
				CartService cartService = new CartServiceIMPL();
				List<CartEntity> cart = cartService.getCart(userId);
				logger.debug("Retrieved cart items: " + cart);

				// Forward the cart data to a JSP for display
				request.setAttribute("cartItems", cart);
				request.getRequestDispatcher("/product-cart.jsp").forward(request, response);
			} catch (Exception e) {
				logger.error("An error occurred while retrieving the cart or forwarding the request", e);
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
			}
		} else {
			// Handle the case where userId is invalid or not provided
			logger.warn("Invalid userId, sending bad request response.");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or missing user ID.");
		}

		logger.debug("Exiting doGet() method in CartServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doPost() method in CartServlet");
		doGet(request, response);
		logger.debug("Exiting doPost() method in CartServlet");
	}
}
