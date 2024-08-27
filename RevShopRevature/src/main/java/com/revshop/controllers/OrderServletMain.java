package com.revshop.controllers;

import java.io.IOException;
import java.util.List;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.OrderEntity;
import com.revshop.service.impl.OrderServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderServletMain
 */
public class OrderServletMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderServiceIMPL orderService = new OrderServiceIMPL();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServletMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginEntity loginUser = (LoginEntity) session.getAttribute("user");

		if (loginUser != null) {
			List<OrderEntity> orders = orderService.getOrdersByUserId(loginUser.getUserId());
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("showOrders.jsp").forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
