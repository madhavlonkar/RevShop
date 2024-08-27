package com.revshop.service;

public interface OrderService {
	
	public boolean placeOrder(int userId, String paymentId, String shippingAddress);

}
