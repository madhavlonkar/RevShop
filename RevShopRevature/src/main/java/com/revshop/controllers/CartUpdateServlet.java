package com.revshop.controllers;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.revshop.Entity.CartEntity;
import com.revshop.service.CartService;
import com.revshop.service.impl.CartServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartUpdateServlet
 */
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CartUpdateServlet.class);  // Logger instance

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartUpdateServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doGet() method in CartUpdateServlet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		logger.debug("Exiting doGet() method in CartUpdateServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doPost() method in CartUpdateServlet");

		try {
			// Get action, product ID, and user ID from request
			String action = request.getParameter("action");
			int productId = Integer.parseInt(request.getParameter("productId"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			logger.debug("Received parameters - action: " + action + ", productId: " + productId + ", userId: " + userId);

			CartService cartService = new CartServiceIMPL();
			CartEntity cart = new CartEntity();
			cart.setProductId(productId);
			cart.setUserId(userId);

			// Update the cart based on the action (e.g., increase or decrease quantity)
			boolean updateSuccess = cartService.updateQuantity(cart, action);
			if (!updateSuccess) {
				request.setAttribute("errorMessage", "Cannot update quantity. Exceeds available stock.");
			}
			logger.debug("Cart update success: " + updateSuccess);

			// Redirect back to the cart page to show the updated cart
			response.sendRedirect("CartServlet?userId=" + userId);
			logger.debug("Redirecting to CartServlet with userId: " + userId);
		} catch (NumberFormatException e) {
			logger.error("Failed to parse productId or userId", e);
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID or user ID.");
		} catch (Exception e) {
			logger.error("An error occurred in doPost()", e);
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
		}

		logger.debug("Exiting doPost() method in CartUpdateServlet");
	}
}
