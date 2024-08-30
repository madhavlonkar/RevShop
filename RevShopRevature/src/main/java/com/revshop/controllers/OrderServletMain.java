package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.OrderEntity;
import com.revshop.service.impl.OrderServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderServletMain extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(OrderServletMain.class); // Logger instance
    private OrderServiceIMPL orderService = new OrderServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doGet() method in OrderServletMain");

        HttpSession session = request.getSession();
        LoginEntity loginUser = (LoginEntity) session.getAttribute("user");

        if (loginUser != null) {
            logger.debug("User is logged in: {}", loginUser.getEmail());
            String action = request.getParameter("action");
            logger.debug("Action parameter: {}", action);

            try {
                if ("myOrders".equals(action) && "seller".equals(loginUser.getRole())) {
                    // Handle the case where the seller wants to see orders placed by them
                    List<OrderEntity> orders = orderService.getOrdersByUserId(loginUser.getUserId());
                    request.setAttribute("orders", orders);
                    logger.info("Displaying orders placed by the seller: {}", loginUser.getEmail());
                    request.getRequestDispatcher("showOrders.jsp").forward(request, response);

                } else if ("seller".equals(loginUser.getRole())) {
                    // Handle the case where the seller wants to see orders placed by buyers from him
                    List<OrderEntity> orders = orderService.getOrdersBySellerId(loginUser.getUserId());
                    request.setAttribute("orders", orders);
                    logger.info("Displaying orders placed by buyers for the seller: {}", loginUser.getEmail());
                    request.getRequestDispatcher("showOrders.jsp").forward(request, response);

                } else {
                    // Handle the case where the buyer wants to see their own orders
                    List<OrderEntity> orders = orderService.getOrdersByUserId(loginUser.getUserId());
                    request.setAttribute("orders", orders);
                    logger.info("Displaying orders placed by the buyer: {}", loginUser.getEmail());
                    request.getRequestDispatcher("showOrders.jsp").forward(request, response);
                }
            } catch (Exception e) {
                logger.error("Error occurred while processing orders for user: {}", loginUser.getEmail(), e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
            }
        } else {
            logger.warn("User is not logged in, redirecting to login page.");
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
        }

        logger.debug("Exiting doGet() method in OrderServletMain");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in OrderServletMain");

        String action = request.getParameter("action");
        logger.debug("Action parameter in POST request: {}", action);

        if ("updateStatus".equals(action)) {
            String orderId = request.getParameter("orderId");
            String status = request.getParameter("status");
            logger.info("Updating order status - Order ID: {}, Status: {}", orderId, status);

            try {
                orderService.updateOrderStatus(orderId, status);
                logger.debug("Order status updated successfully for Order ID: {}", orderId);
            } catch (Exception e) {
                logger.error("Error occurred while updating order status - Order ID: {}", orderId, e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update order status.");
                return;
            }
        }

        doGet(request, response);
        logger.debug("Exiting doPost() method in OrderServletMain");
    }
}
