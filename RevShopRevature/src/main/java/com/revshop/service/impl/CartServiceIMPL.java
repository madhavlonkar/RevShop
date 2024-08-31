package com.revshop.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.ProductEntity;
import com.revshop.dao.CartDAO;
import com.revshop.service.CartService;
import com.revshop.service.ProductService;

public class CartServiceIMPL implements CartService {

    private static final Logger logger = LoggerFactory.getLogger(CartServiceIMPL.class); // Logger instance

    private CartDAO cartDAO;
    private ProductService productService;

    public CartServiceIMPL() {
        this.cartDAO = new CartDAO(); // Initialize the DAO
        this.productService = new ProductServiceIMPL();
    }

    @Override
    public boolean addToCart(CartEntity cartItem) {
        logger.debug("Adding product ID {} to cart for user ID {}", cartItem.getProductId(), cartItem.getUserId());
        try {
            ProductEntity product = productService.getProductById(cartItem.getProductId());

            if (product.getProductStock() < 1) {
                logger.warn("Attempted to add product ID {} to cart, but stock is insufficient", cartItem.getProductId());
                return false; // Prevent adding to cart if no stock is available
            }

            cartItem.setImgUrl(product.getProductImage());
            cartItem.setProductDiscount(product.getProductDiscount());
            cartItem.setProductName(product.getProductName());
            cartItem.setProductPrice(product.getProductPrice());
            int totalPrice = (int) (product.getProductPrice() * (1 - product.getProductDiscount() / 100.0));
            cartItem.setTotalPrice(totalPrice);
            cartItem.setQuantity(1);

            boolean result = cartDAO.insert(cartItem);
            if (result) {
                logger.info("Product ID {} added to cart successfully for user ID {}", cartItem.getProductId(), cartItem.getUserId());
            } else {
                logger.error("Failed to add product ID {} to cart for user ID {}", cartItem.getProductId(), cartItem.getUserId());
            }
            return result;
        } catch (Exception e) {
            logger.error("Error adding product ID {} to cart for user ID {}", cartItem.getProductId(), cartItem.getUserId(), e);
            return false;
        }
    }

    @Override
    public boolean updateQuantity(CartEntity cart, String action) {
        logger.debug("Updating quantity for product ID {} in cart for user ID {} with action {}", cart.getProductId(), cart.getUserId(), action);
        try {
            ProductEntity product = productService.getProductById(cart.getProductId());
            int currentQuantityInCart = cartDAO.getCartItemQuantity(cart.getUserId(), cart.getProductId());

            if ("increase".equals(action)) {
                if (currentQuantityInCart + 1 > product.getProductStock()) {
                    logger.warn("Attempted to increase quantity for product ID {} to {} in cart for user ID {}, but stock is insufficient", 
                        cart.getProductId(), currentQuantityInCart + 1, cart.getUserId());
                    return false; // Prevent increasing if it exceeds available stock
                }
            }

            boolean update = cartDAO.update(cart, action);
            if (update) {
                logger.info("Quantity updated successfully for product ID {} in cart for user ID {}", cart.getProductId(), cart.getUserId());
            } else {
                logger.error("Failed to update quantity for product ID {} in cart for user ID {}", cart.getProductId(), cart.getUserId());
            }
            return update;
        } catch (Exception e) {
            logger.error("Error updating quantity for product ID {} in cart for user ID {}", cart.getProductId(), cart.getUserId(), e);
            return false;
        }
    }

    @Override
    public List<CartEntity> getCart(int userId) {
        logger.debug("Retrieving cart for user ID {}", userId);
        try {
            List<CartEntity> userCart = cartDAO.getCartByUserId(userId);
            logger.info("Retrieved {} items in cart for user ID {}", userCart.size(), userId);
            return userCart;
        } catch (Exception e) {
            logger.error("Error retrieving cart for user ID {}", userId, e);
            return null;
        }
    }

    @Override
    public boolean removeProductFromCart(int userId, int productId) {
        logger.debug("Removing product ID {} from cart for user ID {}", productId, userId);
        try {
            boolean result = cartDAO.deleteProductFromCart(userId, productId);
            if (result) {
                logger.info("Product ID {} removed from cart successfully for user ID {}", productId, userId);
            } else {
                logger.error("Failed to remove product ID {} from cart for user ID {}", productId, userId);
            }
            return result;
        } catch (Exception e) {
            logger.error("Error removing product ID {} from cart for user ID {}", productId, userId, e);
            return false;
        }
    }
}
