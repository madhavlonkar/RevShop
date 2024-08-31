package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProductMaintenanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ProductMaintenanceServlet.class); // Logger instance
    private ProductService productService;

    public ProductMaintenanceServlet() {
        super();
        this.productService = new ProductServiceIMPL();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginEntity user = (LoginEntity) session.getAttribute("user");

        if (user != null && "seller".equals(user.getRole())) {
            int sellerId = user.getUserId();
            logger.debug("Seller logged in with ID: {}", sellerId);

            String category = request.getParameter("category");
            String searchQuery = request.getParameter("s");
            logger.debug("Received parameters - category: {}, searchQuery: {}", category, searchQuery);

            List<ProductEntity> products;

            try {
                if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                    // Search products by keyword for the seller
                    products = productService.searchProductsBySeller(searchQuery, sellerId);
                    logger.debug("Products retrieved by search query: {}", products.size());
                } else if (category != null && !category.isEmpty()) {
                    // Filter products by category for the seller
                    products = productService.getProductsByCategoryAndSeller(category, sellerId);
                    logger.debug("Products retrieved by category: {}", products.size());
                } else {
                    // If no category or search query is provided, show all products of the seller
                	category="electronics";
                	products = productService.getProductsByCategoryAndSeller(category, sellerId);
                    logger.debug("All products retrieved for seller: {}", products.size());
                }

                // Set the selected category and products list in request scope
                request.setAttribute("selectedCategory", category);
                request.setAttribute("products", products);

                List<ProductEntity> lowStockProducts = productService.getLowStockProducts(sellerId);
                request.setAttribute("lowStockProducts", lowStockProducts);
                logger.debug("Low stock products retrieved: {}", lowStockProducts.size());

                request.getRequestDispatcher("Seller/SellerDashboard.jsp").forward(request, response);
                logger.debug("Forwarded to Seller/SellerDashboard.jsp");
            } catch (Exception e) {
                logger.error("Error occurred while processing product maintenance for seller ID: {}", sellerId, e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
            }
        } else {
            logger.warn("Unauthorized access attempt by user with role: {}", (user != null ? user.getRole() : "unknown"));
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
