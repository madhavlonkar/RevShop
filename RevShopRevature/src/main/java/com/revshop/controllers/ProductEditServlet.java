package com.revshop.controllers;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductEditServlet
 */
public class ProductEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ProductEditServlet.class);  // Logger instance
    private ProductService productService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEditServlet() {
        super();
        this.productService = new ProductServiceIMPL();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdParam = request.getParameter("id");
        logger.debug("Received product ID parameter: {}", productIdParam);

        try {
            int productId = Integer.parseInt(productIdParam);
            logger.debug("Parsed product ID: {}", productId);

            // Retrieve the product using the service
            ProductEntity product = productService.getProductById(productId);

            // Check if product is not null
            if (product != null) {
                logger.debug("Product found: {}", product.getProductName());
                // Set the product as a request attribute
                request.setAttribute("product", product);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Seller/editProduct.jsp");
                dispatcher.forward(request, response);
                logger.debug("Forwarded to Seller/editProduct.jsp");
            } else {
                logger.warn("Product not found for ID: {}", productId);
                // If product not found, redirect to an error page or display a message
                response.sendRedirect("errorPage.jsp");
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid product ID format: {}", productIdParam, e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (Exception e) {
            logger.error("Error occurred while processing product edit for ID: {}", productIdParam, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
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
