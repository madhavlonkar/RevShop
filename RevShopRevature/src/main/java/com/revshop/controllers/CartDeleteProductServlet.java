package com.revshop.controllers;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.revshop.service.CartService;
import com.revshop.service.impl.CartServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartDeleteProductServlet
 */
public class CartDeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CartDeleteProductServlet.class);  // Logger instance

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartDeleteProductServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doGet() method in CartDeleteProductServlet");
		doPost(request, response);
		logger.debug("Exiting doGet() method in CartDeleteProductServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("Entering doPost() method in CartDeleteProductServlet");

		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			logger.debug("Received parameters - productId: " + productId + ", userId: " + userId);

			CartService cartService = new CartServiceIMPL();

			boolean removed = cartService.removeProductFromCart(userId, productId);
			logger.debug("Product removed from cart: " + removed);

			response.sendRedirect("CartServlet?userId=" + userId);
			logger.debug("Redirecting to CartServlet with userId: " + userId);
		} catch (NumberFormatException e) {
			logger.error("Failed to parse productId or userId", e);
			response.sendRedirect("error.jsp");
		} catch (Exception e) {
			logger.error("An error occurred in doPost()", e);
			response.sendRedirect("error.jsp");
		}

		logger.debug("Exiting doPost() method in CartDeleteProductServlet");
	}
}
