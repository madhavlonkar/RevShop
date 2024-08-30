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
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(AddToCartServlet.class); // Logger instance

	private CartService cartService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartServlet() {
		super();
		cartService = new CartServiceIMPL();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doGet() method in AddToCartServlet");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		logger.debug("Exiting doGet() method in AddToCartServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doPost() method in AddToCartServlet");

		String productIdParam = request.getParameter("productId");
		String userIdParam = request.getParameter("userId");
		logger.debug("Received parameters - productId: " + productIdParam + ", userId: " + userIdParam);

		int productId = 0;
		int userId = 0;

		try {
			productId = Integer.parseInt(productIdParam);
			userId = Integer.parseInt(userIdParam);
			logger.debug("Parsed parameters - productId: " + productId + ", userId: " + userId);
		} catch (NumberFormatException e) {
			logger.error("Failed to parse productId or userId", e);
			response.sendRedirect("error.jsp");
			return;
		}

		CartEntity cartItem = new CartEntity();
		cartItem.setProductId(productId);
		cartItem.setUserId(userId);
		logger.debug("Created CartEntity - " + cartItem);

		boolean success = cartService.addToCart(cartItem);

		if (success) {
			logger.debug("Item successfully added to cart");
			response.sendRedirect("HomeServlet");
		} else {
			logger.error("Failed to add item to cart");
			response.sendRedirect("error.jsp");
		}

		logger.debug("Exiting doPost() method in AddToCartServlet");
	}
}
