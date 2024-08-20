package com.revshop.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class ProductAddServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productName = request.getParameter("product_name");
	    String productDescription = request.getParameter("product_description");
	    double productPrice = Double.parseDouble(request.getParameter("product_price"));
	    double productDiscount = Double.parseDouble(request.getParameter("product_discount"));
	    int productStock = Integer.parseInt(request.getParameter("product_stock"));
	    String productBrand = request.getParameter("product_brand");
	    String productCategory = request.getParameter("product_category");
	    String productStatus = request.getParameter("product_status");
	    String productTags = request.getParameter("product_tags");

	    // Retrieve the uploaded file
	    Part filePart = request.getPart("product_image");
	    
	    // Convert the uploaded file into a byte array
	    byte[] imageBytes = filePart.getInputStream().readAllBytes();

	    // Create a new ProductEntity and set its fields
	    ProductEntity product = new ProductEntity();
	    product.setProductName(productName);
	    product.setProductDescription(productDescription);
	    product.setProductPrice(productPrice);
	    product.setProductDiscount(productDiscount);
	    product.setProductStock(productStock);
	    product.setProductBrand(productBrand);
	    product.setProductCategory(productCategory);
	    product.setProductStatus(productStatus);
	    product.setProductTags(productTags);
	    
	    // Set the image bytes in the product entity
	    product.setProductImage(imageBytes);

	    // Save the product to the database
	    ProductService productService = new ProductServiceIMPL();
	    boolean isProductSaved = productService.saveProduct(product);

	    // Respond to the client
	    if (isProductSaved) {
	        response.getWriter().println("Product added successfully.");
	    } else {
	        response.getWriter().println("Failed to add product.");
	    }
	}

}
