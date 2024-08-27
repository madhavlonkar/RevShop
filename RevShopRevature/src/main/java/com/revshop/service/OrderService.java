package com.revshop.service;

import java.util.List;

import com.revshop.Entity.OrderEntity;

public interface OrderService {

	public boolean placeOrder(int userId, String paymentId, String shippingAddress);

	List<OrderEntity> getOrdersByUserId(int userId);
}
