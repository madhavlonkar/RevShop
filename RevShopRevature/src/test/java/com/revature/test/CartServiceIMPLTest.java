package com.revature.test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.ProductEntity;
import com.revshop.dao.CartDAO;
import com.revshop.service.ProductService;
import com.revshop.service.impl.CartServiceIMPL;

public class CartServiceIMPLTest {

    @InjectMocks
    private CartServiceIMPL cartService;

    @Mock
    private CartDAO cartDAO;

    @Mock
    private ProductService productService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddToCart_ProductInStock() {
        // Arrange
        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setUserId(100);

        ProductEntity product = new ProductEntity();
        product.setProductId(1);
        product.setProductStock(10);
        product.setProductImage("img.jpg");
        product.setProductDiscount(10);
        product.setProductName("Test Product");
        product.setProductPrice(100.0);

        when(productService.getProductById(1)).thenReturn(product);
        when(cartDAO.insert(cartItem)).thenReturn(true);

        // Act
        boolean result = cartService.addToCart(cartItem);

        // Assert
        assertTrue(result);
        verify(cartDAO, times(1)).insert(cartItem);
    }

    @Test
    void testAddToCart_ProductOutOfStock() {
        // Arrange
        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setUserId(100);

        ProductEntity product = new ProductEntity();
        product.setProductId(1);
        product.setProductStock(0); // Out of stock

        when(productService.getProductById(1)).thenReturn(product);

        // Act
        boolean result = cartService.addToCart(cartItem);

        // Assert
        assertFalse(result);
        verify(cartDAO, never()).insert(cartItem);
    }

    @Test
    void testUpdateQuantity_IncreaseWithinStock() {
        // Arrange
        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setUserId(100);

        ProductEntity product = new ProductEntity();
        product.setProductId(1);
        product.setProductStock(10);

        when(productService.getProductById(1)).thenReturn(product);
        when(cartDAO.getCartItemQuantity(100, 1)).thenReturn(5);
        when(cartDAO.update(cartItem, "increase")).thenReturn(true);

        // Act
        boolean result = cartService.updateQuantity(cartItem, "increase");

        // Assert
        assertTrue(result);
        verify(cartDAO, times(1)).update(cartItem, "increase");
    }

    @Test
    void testUpdateQuantity_IncreaseExceedsStock() {
        // Arrange
        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setUserId(100);

        ProductEntity product = new ProductEntity();
        product.setProductId(1);
        product.setProductStock(5);

        when(productService.getProductById(1)).thenReturn(product);
        when(cartDAO.getCartItemQuantity(100, 1)).thenReturn(5);

        // Act
        boolean result = cartService.updateQuantity(cartItem, "increase");

        // Assert
        assertFalse(result);
        verify(cartDAO, never()).update(cartItem, "increase");
    }

    @Test
    void testUpdateQuantity_DecreaseQuantity() {
        // Arrange
        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setUserId(100);

        when(cartDAO.update(cartItem, "decrease")).thenReturn(true);

        // Act
        boolean result = cartService.updateQuantity(cartItem, "decrease");

        // Assert
        assertTrue(result);
        verify(cartDAO, times(1)).update(cartItem, "decrease");
    }

    @Test
    void testGetCart() {
        // Arrange
        CartEntity cartItem1 = new CartEntity();
        cartItem1.setProductId(1);
        cartItem1.setUserId(100);
        
        CartEntity cartItem2 = new CartEntity();
        cartItem2.setProductId(2);
        cartItem2.setUserId(100);

        List<CartEntity> cartItems = Arrays.asList(cartItem1, cartItem2);

        when(cartDAO.getCartByUserId(100)).thenReturn(cartItems);

        // Act
        List<CartEntity> result = cartService.getCart(100);

        // Assert
        assertEquals(2, result.size());
        verify(cartDAO, times(1)).getCartByUserId(100);
    }

    @Test
    void testRemoveProductFromCart_Success() {
        // Arrange
        when(cartDAO.deleteProductFromCart(100, 1)).thenReturn(true);

        // Act
        boolean result = cartService.removeProductFromCart(100, 1);

        // Assert
        assertTrue(result);
        verify(cartDAO, times(1)).deleteProductFromCart(100, 1);
    }

    @Test
    void testRemoveProductFromCart_Failure() {
        // Arrange
        when(cartDAO.deleteProductFromCart(100, 1)).thenReturn(false);

        // Act
        boolean result = cartService.removeProductFromCart(100, 1);

        // Assert
        assertFalse(result);
        verify(cartDAO, times(1)).deleteProductFromCart(100, 1);
    }
}
