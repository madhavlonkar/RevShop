package com.revshop.controllers;

import java.io.IOException;

import com.revshop.service.LoginService;
import com.revshop.service.impl.LoginServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

//	private static final Logger logger = LoggerFactory.getLogger(LoginServlet.class);

    // Page paths
    private static final String LOGIN_REGISTRATION_JSP = "LoginAndRegistration/LoginAndRegistration.jsp";
    private static final String SUCCESS_PAGE = "OtherPages/success.jsp";

    private final LoginService loginService = LoginServiceIMPL.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(LOGIN_REGISTRATION_JSP).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null) {
            forwardWithError(request, response, "Username and password are required.");
            return;
        }

        try {
            if (loginService.validate(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirect to the dashboard or home page after successful login
                response.sendRedirect(SUCCESS_PAGE);
            } else {
                forwardWithError(request, response, "Invalid username or password");
            }
        } catch (Exception e) {
        	e.printStackTrace();
//            logger.error("Error during login: ", e);
            forwardWithError(request, response, "An unexpected error occurred. Please try again later.");
        }
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("LoginerrorMessage", errorMessage);
        request.setAttribute("section", "sign-in");
        request.getRequestDispatcher(LOGIN_REGISTRATION_JSP).forward(request, response);
    }

}
