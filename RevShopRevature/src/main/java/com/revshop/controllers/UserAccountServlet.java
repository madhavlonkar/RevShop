package com.revshop.controllers;

import java.io.IOException;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.UserEntity;
import com.revshop.service.UserService;
import com.revshop.service.impl.UserServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserAccountServlet
 */
public class UserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAccountServlet() {
        super();
        this.userService = new UserServiceIMPL();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve the session and get the logged-in user's email
        HttpSession session = request.getSession(false);
        LoginEntity loggedInUser = (LoginEntity) (session != null ? session.getAttribute("user") : null);

        if (loggedInUser != null) {
            // Fetch user details by ID
            UserEntity userDetails = userService.getUserById(loggedInUser.getUserId());

            // Set the user details in the request scope to be available for JSP
            request.setAttribute("userDetails", userDetails);

            // Forward the request to the JSP page to display the user details
            request.getRequestDispatcher("LoginAndRegistration/userAccount.jsp").forward(request, response);
        } else {
            // If no user is logged in, redirect to the login page
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
