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
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        logger.debug("Received request to delete product with ID: {}", productIdStr);

        try {
            int productId = Integer.parseInt(productIdStr);
            logger.debug("Parsed product ID: {}", productId);

            boolean isDeleted = productService.deleteProduct(productId);

            if (isDeleted) {
                logger.info("Product with ID {} successfully deleted.", productId);
                response.setStatus(HttpServletResponse.SC_OK); // 200 OK
            } else {
                logger.error("Failed to delete product with ID {}.", productId);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid product ID format: {}", productIdStr, e);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
        } catch (Exception e) {
            logger.error("Unexpected error occurred while deleting product with ID: {}", productIdStr, e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
        }
    }
}
