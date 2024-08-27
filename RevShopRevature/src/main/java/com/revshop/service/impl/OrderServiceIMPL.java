package com.revshop.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.OrderEntity;
import com.revshop.Entity.TransactionEntity;
import com.revshop.dao.CartDAO;
import com.revshop.dao.OrderDAO;
import com.revshop.dao.ProductDAO;
import com.revshop.dao.TransactionDAO;
import com.revshop.service.OrderService;
import com.revshop.utility.DBConnection;

public class OrderServiceIMPL implements OrderService {

	private OrderDAO orderDAO;
	private TransactionDAO transactionDAO;
	private CartDAO cartDAO;
	private ProductDAO productDAO;

	public OrderServiceIMPL() {
		this.orderDAO = new OrderDAO();
		this.transactionDAO = new TransactionDAO();
		this.cartDAO = new CartDAO();
		this.productDAO = ProductDAO.getInstance();
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
}
