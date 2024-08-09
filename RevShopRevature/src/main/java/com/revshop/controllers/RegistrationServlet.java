package com.revshop.controllers;

import java.io.IOException;

import com.revshop.dao.RegistrationDAO;
import com.revshop.dto.RegistrationDTO;
import com.revshop.utility.BCryptPasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("LoginAndRegistration/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userType = request.getParameter("userType");
		String userName = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String hashedPassword = BCryptPasswordUtil.hashPassword(password);

		RegistrationDTO registration = new RegistrationDTO();
		registration.setEmail(email);
		registration.setUserId(1);
		registration.setUserName(userName);
		registration.setFirstLogin(true);
		registration.setPassword(hashedPassword);
		registration.setRole(userType);

		RegistrationDAO rdao = new RegistrationDAO();
		try {
			// Check if email or username already exists
			if (rdao.emailExists(registration.getEmail())) {
			    request.setAttribute("errorMessage", "Email already exists. Please use a different email.");
			    request.setAttribute("section", "sign-up");
			    request.getRequestDispatcher("LoginAndRegistration/LoginAndRegistration.jsp").forward(request, response);
			    return;
			}

			if (rdao.usernameExists(registration.getUserName())) {
			    request.setAttribute("errorMessage", "Username already exists. Please choose a different username.");
			    request.setAttribute("section", "sign-up");
			    request.getRequestDispatcher("LoginAndRegistration/LoginAndRegistration.jsp").forward(request, response);
			    return;
			}


			// Save the registration details
			boolean result = rdao.saveLogin(registration);

			if (result) {
				response.sendRedirect("OtherPages/Success.html");
			} else {
				// If save failed, redirect to an error page
				response.sendRedirect("OtherPages/Error.html");
			}

		} catch (Exception e) {
			// Log the exception and redirect to an error page
			System.out.println("Error during registration: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
			request.getRequestDispatcher("LoginAndRegistration/LoginAndRegistration.jsp").forward(request, response);
		}
	}

}
