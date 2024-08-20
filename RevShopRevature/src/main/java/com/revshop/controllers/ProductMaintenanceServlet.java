package com.revshop.controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductMaintenanceServlet
 */
public class ProductMaintenanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductService productService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMaintenanceServlet() {
        super();
        this.productService = new ProductServiceIMPL();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve all products
        List<ProductEntity> products = productService.getAllProducts();

        // Set products in request scope
        request.setAttribute("products", products);

        // Forward to JSP page
        request.getRequestDispatcher("Seller/SellerDashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
