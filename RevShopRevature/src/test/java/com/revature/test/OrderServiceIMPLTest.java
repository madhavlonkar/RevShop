package com.revature.test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.CartEntity;
import com.revshop.Entity.OrderEntity;
import com.revshop.Entity.TransactionEntity;
import com.revshop.dao.CartDAO;
import com.revshop.dao.OrderDAO;
import com.revshop.dao.ProductDAO;
import com.revshop.dao.TransactionDAO;
import com.revshop.dao.UserDAO;
import com.revshop.service.impl.OrderServiceIMPL;

public class OrderServiceIMPLTest {

    @InjectMocks
    private OrderServiceIMPL orderService;

    @Mock
    private OrderDAO orderDAO;

    @Mock
    private TransactionDAO transactionDAO;

    @Mock
    private CartDAO cartDAO;

    @Mock
    private ProductDAO productDAO;

    @Mock
    private UserDAO userDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testPlaceOrder_Success() throws SQLException {
        int userId = 1;
        String paymentId = "PAY123";
        String shippingAddress = "123 Street, City";

        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setProductName("Product 1");
        cartItem.setTotalPrice((int) 100.0);
        cartItem.setQuantity(1);

        when(cartDAO.getCartByUserId(userId)).thenReturn(Arrays.asList(cartItem));
        when(productDAO.getSellerIdByProductId(cartItem.getProductId())).thenReturn(1);

        doNothing().when(orderDAO).insert(any(OrderEntity.class));
        doNothing().when(transactionDAO).insert(any(TransactionEntity.class));
        doNothing().when(productDAO).updateProductStock(cartItem.getProductId(), cartItem.getQuantity());
        doNothing().when(cartDAO).deleteProductFromCart(userId, cartItem.getProductId());

        boolean result = orderService.placeOrder(userId, paymentId, shippingAddress);

        assertTrue(result);
        verify(orderDAO, times(1)).insert(any(OrderEntity.class));
        verify(transactionDAO, times(1)).insert(any(TransactionEntity.class));
        verify(productDAO, times(1)).updateProductStock(cartItem.getProductId(), cartItem.getQuantity());
        verify(cartDAO, times(1)).deleteProductFromCart(userId, cartItem.getProductId());
    }

    @Test
    void testPlaceOrder_Failure() throws SQLException {
        int userId = 1;
        String paymentId = "PAY123";
        String shippingAddress = "123 Street, City";

        CartEntity cartItem = new CartEntity();
        cartItem.setProductId(1);
        cartItem.setProductName("Product 1");
        cartItem.setTotalPrice((int) 100.0);
        cartItem.setQuantity(1);

        when(cartDAO.getCartByUserId(userId)).thenReturn(Arrays.asList(cartItem));
        when(productDAO.getSellerIdByProductId(cartItem.getProductId())).thenReturn(1);

        doThrow(new SQLException("Database error")).when(orderDAO).insert(any(OrderEntity.class));

        boolean result = orderService.placeOrder(userId, paymentId, shippingAddress);

        assertFalse(result);
        verify(orderDAO, times(1)).insert(any(OrderEntity.class));
    }

    @Test
    void testGetOrdersByUserId_Success() throws SQLException {
        int userId = 1;

        OrderEntity order = new OrderEntity();
        order.setOrderId("OD123");

        when(orderDAO.getOrdersByUserId(userId)).thenReturn(Arrays.asList(order));

        List<OrderEntity> orders = orderService.getOrdersByUserId(userId);

        assertNotNull(orders);
        assertEquals(1, orders.size());
        verify(orderDAO, times(1)).getOrdersByUserId(userId);
    }

    @Test
    void testGetOrdersByUserId_Failure() throws SQLException {
        int userId = 1;

        when(orderDAO.getOrdersByUserId(userId)).thenThrow(new SQLException("Database error"));

        List<OrderEntity> orders = orderService.getOrdersByUserId(userId);

        assertNull(orders);
        verify(orderDAO, times(1)).getOrdersByUserId(userId);
    }

    @Test
    void testUpdateOrderStatus_Success() throws SQLException {
        String orderId = "OD123";
        String status = "Shipped";

        when(orderDAO.updateOrderStatus(orderId, status)).thenReturn(true);

        boolean result = orderService.updateOrderStatus(orderId, status);

        assertTrue(result);
        verify(orderDAO, times(1)).updateOrderStatus(orderId, status);
    }

    @Test
    void testUpdateOrderStatus_Failure() throws SQLException {
        String orderId = "OD123";
        String status = "Shipped";

        when(orderDAO.updateOrderStatus(orderId, status)).thenThrow(new SQLException("Database error"));

        boolean result = orderService.updateOrderStatus(orderId, status);

        assertFalse(result);
        verify(orderDAO, times(1)).updateOrderStatus(orderId, status);
    }
}
