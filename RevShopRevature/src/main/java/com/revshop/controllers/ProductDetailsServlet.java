package com.revshop.controllers;

import java.io.IOException;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetailsServlet
 */
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productIdParam = request.getParameter("productId");
        int productId = 0;
        if (productIdParam != null) {
            try {
                productId = Integer.parseInt(productIdParam);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
                return;
            }
        }

        ProductService productService = new ProductServiceIMPL();
        // Retrieve the product details using the service
        ProductEntity product = productService.getProductById(productId);

        if (product != null) {
            // Set the product object in the request attributes
            request.setAttribute("product", product);
            // Forward to the JSP page for rendering
            request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
        } else {
            // If product not found, show error
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
