package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.Entity;
import com.revshop.utility.DBConnection;

public class CartDAO implements DAO {

    private static final Logger logger = LoggerFactory.getLogger(CartDAO.class); // Logger instance

    @Override
    public boolean insert(Entity entity) {
        if (entity instanceof CartEntity) {
            CartEntity cartItem = (CartEntity) entity;
            String query = "INSERT INTO tbl_cart (user_id, productName, productPrice, productDiscount, imgUrl, totalPrice, quantity, product_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(query)) {

                stmt.setInt(1, cartItem.getUserId());
                stmt.setString(2, cartItem.getProductName());
                stmt.setDouble(3, cartItem.getProductPrice());
                stmt.setDouble(4, cartItem.getProductDiscount());
                stmt.setString(5, cartItem.getImgUrl());
                stmt.setDouble(6, cartItem.getTotalPrice());
                stmt.setInt(7, cartItem.getQuantity());
                stmt.setInt(8, cartItem.getProductId());

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    logger.info("Inserted cart item for user ID: {}, product ID: {}", cartItem.getUserId(), cartItem.getProductId());
                    return true;
                }
            } catch (SQLException e) {
                logger.error("Error inserting cart item for user ID: {}, product ID: {}", cartItem.getUserId(), cartItem.getProductId(), e);
            }
        }
        return false;
    }

    @Override
    public boolean update(Entity entity) {
        // Not implemented in this version
        return false;
    }

    @Override
    public boolean delete(int id) {
        // Not implemented in this version
        return false;
    }

    @Override
    public Entity retrieveById(int id) {
        // Not implemented in this version
        return null;
    }

    @Override
    public List<Entity> retrieveAll() {
        // Not implemented in this version
        return null;
    }

    public List<CartEntity> getCartByUserId(int userId) {
        List<CartEntity> cartItems = new ArrayList<>();
        String query = "SELECT * FROM tbl_cart WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CartEntity cartItem = new CartEntity();
                    cartItem.setCartItemId(rs.getInt("cart_id"));
                    cartItem.setUserId(rs.getInt("user_id"));
                    cartItem.setProductName(rs.getString("productName"));
                    cartItem.setProductPrice(rs.getDouble("productPrice"));
                    cartItem.setProductDiscount(rs.getDouble("productDiscount"));
                    cartItem.setImgUrl(rs.getString("imgUrl"));
                    cartItem.setTotalPrice(rs.getInt("totalPrice"));
                    cartItem.setProductId(rs.getInt("product_Id"));
                    cartItem.setQuantity(rs.getInt("quantity"));

                    cartItems.add(cartItem);
                }
                logger.info("Retrieved {} cart items for user ID: {}", cartItems.size(), userId);
            }
        } catch (SQLException e) {
            logger.error("Error retrieving cart items for user ID: {}", userId, e);
        }

        return cartItems;
    }

    public boolean update(Entity entity, String action) {
        if (entity instanceof CartEntity) {
            CartEntity cartItem = (CartEntity) entity;
            String query = "";

            if ("increase".equals(action)) {
                query = "UPDATE tbl_cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
            } else if ("decrease".equals(action)) {
                // First, check if the current quantity is 1
                query = "SELECT quantity FROM tbl_cart WHERE user_id = ? AND product_id = ?";

                try (Connection conn = DBConnection.getConnection();
                     PreparedStatement stmt = conn.prepareStatement(query)) {

                    stmt.setInt(1, cartItem.getUserId());
                    stmt.setInt(2, cartItem.getProductId());

                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        int currentQuantity = rs.getInt("quantity");

                        if (currentQuantity == 1) {
                            // If quantity is 1, call the delete method
                            deleteProductFromCart(cartItem.getUserId(), cartItem.getProductId());
                            logger.info("Product ID: {} removed from cart for user ID: {} due to quantity decrease to 1", cartItem.getProductId(), cartItem.getUserId());
                            return true; // Product has been deleted
                        } else {
                            // If quantity is more than 1, decrease the quantity
                            query = "UPDATE tbl_cart SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ? AND quantity > 1";
                        }
                    } else {
                        logger.warn("No such product found in cart for user ID: {}, product ID: {}", cartItem.getUserId(), cartItem.getProductId());
                        return false; // No such product found in the cart
                    }
                } catch (SQLException e) {
                    logger.error("Error updating cart item for user ID: {}, product ID: {}", cartItem.getUserId(), cartItem.getProductId(), e);
                    return false;
                }
            } else {
                logger.warn("Unsupported action: {} for cart update", action);
                return false; // Unsupported action
            }

            // Execute the update if applicable
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(query)) {

                stmt.setInt(1, cartItem.getUserId());
                stmt.setInt(2, cartItem.getProductId());

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    logger.info("Cart updated successfully for user ID: {}, product ID: {}, action: {}", cartItem.getUserId(), cartItem.getProductId(), action);
                }
                return rowsAffected > 0;

            } catch (SQLException e) {
                logger.error("Error updating cart for user ID: {}, product ID: {}", cartItem.getUserId(), cartItem.getProductId(), e);
                return false;
            }
        }
        return false;
    }

    public boolean deleteProductFromCart(int userId, int productId) {
        String query = "DELETE FROM tbl_cart WHERE user_id = ? AND product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                logger.info("Deleted product ID: {} from cart for user ID: {}", productId, userId);
            }
            return rowsAffected > 0; // Returns true if the product was deleted, otherwise false

        } catch (SQLException e) {
            logger.error("Error deleting product ID: {} from cart for user ID: {}", productId, userId, e);
            return false; // Return false if there was an exception
        }
    }
    
    public int getCartItemQuantity(int userId, int productId) {
        String query = "SELECT quantity FROM tbl_cart WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, productId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("quantity");
                }
            }
        } catch (SQLException e) {
            logger.error("Error retrieving cart item quantity for user ID: {}, product ID: {}", userId, productId, e);
        }
        return 0; // Default to 0 if not found
    }

}
