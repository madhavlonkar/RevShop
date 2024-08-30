package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(HomeServlet.class);  // Logger instance

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doGet() method in HomeServlet");

        try {
            ProductService productService = new ProductServiceIMPL();

            String category = request.getParameter("category");
            String searchQuery = request.getParameter("s");
            logger.debug("Received parameters - category: " + category + ", searchQuery: " + searchQuery);

            List<ProductEntity> products;

            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                products = productService.searchProducts(searchQuery);
                logger.debug("Products retrieved by search query: " + products.size());
            } else if (category != null && !category.isEmpty()) {
                products = productService.getProductsByCategory(category);
                logger.debug("Products retrieved by category: " + products.size());
            } else {
                category = "Electronics"; // Set your default category here
                products = productService.getProductsByCategory(category);
                logger.debug("Products retrieved by default category 'Electronics': " + products.size());
            }

            request.setAttribute("selectedCategory", category);

            request.setAttribute("products", products);

            request.getRequestDispatcher("/index.jsp").forward(request, response);
            logger.debug("Forwarded to index.jsp with products and category");
        } catch (Exception e) {
            logger.error("An error occurred in doGet() method of HomeServlet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }

        logger.debug("Exiting doGet() method in HomeServlet");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in HomeServlet");
        doGet(request, response);
        logger.debug("Exiting doPost() method in HomeServlet");
    }
}
