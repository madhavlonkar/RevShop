package com.revshop.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.OrderEntity;
import com.revshop.Entity.TransactionEntity;
import com.revshop.Entity.UserEntity;
import com.revshop.dao.CartDAO;
import com.revshop.dao.OrderDAO;
import com.revshop.dao.ProductDAO;
import com.revshop.dao.TransactionDAO;
import com.revshop.dao.UserDAO;
import com.revshop.service.OrderService;
import com.revshop.utility.DBConnection;
import com.revshop.utility.EcommerceEmailUtility;

public class OrderServiceIMPL implements OrderService {

    private OrderDAO orderDAO;
    private TransactionDAO transactionDAO;
    private CartDAO cartDAO;
    private ProductDAO productDAO;
    private UserDAO userDAO;

    public OrderServiceIMPL() {
        this.orderDAO = new OrderDAO();
        this.transactionDAO = new TransactionDAO();
        this.cartDAO = new CartDAO();
        this.productDAO = ProductDAO.getInstance();
        this.userDAO = UserDAO.getInstance();
    }

    public boolean placeOrder(int userId, String paymentId, String shippingAddress) {
        Connection connection = null;
        boolean orderPlaced = false;

        try {
            // Establish a connection and start a transaction
            connection = DBConnection.getConnection();
            connection.setAutoCommit(false); // Start transaction

            // Fetch cart items for the user
            List<CartEntity> cartItems = cartDAO.getCartByUserId(userId);

            for (CartEntity item : cartItems) {
                // Fetch the seller ID from the product table
                int sellerId = productDAO.getSellerIdByProductId(item.getProductId());

                // Create and save the order
                OrderEntity order = new OrderEntity();
                order.setOrderId("OD" + System.currentTimeMillis() + (int) (Math.random() * 10000));
                order.setUserId(userId);
                order.setSellerId(sellerId);
                order.setProductId(item.getProductId());
                order.setTranscationId(paymentId);
                order.setProductName(item.getProductName());
                order.setTotalPrice(item.getTotalPrice());
                order.setQuantity(item.getQuantity());
                order.setImgUrl(item.getImgUrl());
                order.setStatus("To Be Shipped");
                order.setShippingAddress(shippingAddress);
                orderDAO.insert(order);

                // Save transaction details
                TransactionEntity transaction = new TransactionEntity();
                transaction.setTransactionId(paymentId);
                transaction.setOrderId(order.getOrderId());
                transaction.setAmount(order.getTotalPrice());
                transaction.setUserId(userId);
                transaction.setSellerId(sellerId);
                transactionDAO.insert(transaction);

                // Update product stock
                productDAO.updateProductStock(item.getProductId(), item.getQuantity());

                // Remove items from the cart
                cartDAO.deleteProductFromCart(userId, item.getProductId());

                // Send emails to buyer and seller
                sendOrderEmails(order, shippingAddress, item, sellerId,userId);
            }

            // Commit the transaction if everything is successful
            connection.commit();
            orderPlaced = true;

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback in case of error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true); // Reset auto-commit mode
                    connection.close(); // Close the connection
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return orderPlaced;
    }

    private void sendOrderEmails(OrderEntity order, String shippingAddress, CartEntity item, int sellerId,int userId) {
        // Retrieve the buyer's UserEntity
    	String buyerEmail = userDAO.retrieveById(userId).getEmail();
        // Retrieve the seller's UserEntity
    	String sellerEmail = userDAO.retrieveById(sellerId).getEmail();

        // Get the email addresses

        if (buyerEmail != null && sellerEmail != null) {
            // Prepare email content for buyer
            String buyerSubject = "Order Confirmation - " + order.getOrderId();
            String buyerMessage = "<h1>Thank you for your purchase!</h1>"
                    + "<p>Your order <b>" + order.getOrderId() + "</b> has been placed successfully.</p>"
                    + "<p>Product: " + order.getProductName() + "</p>"
                    + "<p>Quantity: " + order.getQuantity() + "</p>"
                    + "<p>Total Price: RS" + order.getTotalPrice() + "</p>"
                    + "<p>Shipping Address: " + shippingAddress + "</p>"
                    + "<p>We will notify you once your order is shipped.</p>"
                    + "<br><p>Thank you for shopping with us!</p>";

            // Send email to buyer
            EcommerceEmailUtility.sendOrderConfirmationToBuyer(buyerEmail, buyerSubject, buyerMessage);

            // Prepare email content for seller
            String sellerSubject = "New Order Placed - " + order.getOrderId();
            String sellerMessage = "<h1>New Order Received!</h1>"
                    + "<p>Order <b>" + order.getOrderId() + "</b> has been placed by a customer.</p>"
                    + "<p>Product: " + order.getProductName() + "</p>"
                    + "<p>Quantity: " + order.getQuantity() + "</p>"
                    + "<p>Total Price: RS" + order.getTotalPrice() + "</p>"
                    + "<p>Shipping Address: " + shippingAddress + "</p>"
                    + "<br><p>Please proceed with the necessary steps to ship the order.</p>";

            // Send email to seller
            EcommerceEmailUtility.sendOrderNotificationToSeller(sellerEmail, sellerSubject, sellerMessage);
        } else {
            // Handle cases where emails could not be retrieved (e.g., log an error)
            if (buyerEmail == null) {
                System.err.println("Buyer email could not be retrieved for userId: " + order.getUserId());
            }
            if (sellerEmail == null) {
                System.err.println("Seller email could not be retrieved for sellerId: " + sellerId);
            }
        }
    }

    @Override
    public List<OrderEntity> getOrdersByUserId(int userId) {
        try {
            return orderDAO.getOrdersByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the exception
            return null;
        }
    }

    @Override
    public List<OrderEntity> getOrdersBySellerId(int sellerId) {
        try {
            return orderDAO.getOrdersBySellerId(sellerId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean updateOrderStatus(String orderId, String status) {
        try {
            return orderDAO.updateOrderStatus(orderId, status);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
