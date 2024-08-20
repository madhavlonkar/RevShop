package com.revshop.controllers;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDeleteServlet
 */
public class ProductDeleteServlet extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(ProductDeleteServlet.class);
	private static final long serialVersionUID = 1L;
	private ProductService productService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDeleteServlet() {
		super();
		this.productService = new ProductServiceIMPL();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String productIdStr = request.getParameter("productId");

	        try {
	            int productId = Integer.parseInt(productIdStr);
	            ProductService productService = new ProductServiceIMPL();

	            boolean isDeleted = productService.deleteProduct(productId);

	            if (isDeleted) {
	                // Redirect back to the same page after successful deletion
	                response.sendRedirect(request.getContextPath() + "/ProductMaintenanceServlet");
	            } else {
	                // Handle the case where deletion fails
	                request.setAttribute("errorMessage", "Failed to delete the product. Please try again.");
	                request.getRequestDispatcher(request.getContextPath() + "/ProductMaintenanceServlet").forward(request, response);
	            }
	        } catch (NumberFormatException e) {
	            // Handle invalid product ID format
	            request.setAttribute("errorMessage", "Invalid product ID.");
	            request.getRequestDispatcher(request.getContextPath() + "/ProductMaintenanceServlet").forward(request, response);
	        } catch (Exception e) {
	            // Handle any other exceptions
	            request.setAttribute("errorMessage", "An error occurred while deleting the product. Please try again.");
	            request.getRequestDispatcher(request.getContextPath() + "/ProductMaintenanceServlet").forward(request, response);
	        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

}
