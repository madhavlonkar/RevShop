package com.revshop.controllers;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revature.helper.RegistrationHelper;
import com.revshop.Entity.LoginEntity;
import com.revshop.service.LoginService;
import com.revshop.service.impl.LoginServiceIMPL;
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
    private static final Logger logger = LoggerFactory.getLogger(RegistrationServlet.class);

    // Page paths
    private static final String LOGIN_REGISTRATION_JSP = "LoginAndRegistration/user-register.jsp";
    private static final String ERROR_PAGE = "OtherPages/Error.html";
    private static final String DETAIL_REGISTRATION_JSP = "LoginAndRegistration/detail-registration.jsp";

    private final LoginService loginService = LoginServiceIMPL.getInstance();

    public RegistrationServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doGet() method in RegistrationServlet");
        request.getRequestDispatcher(LOGIN_REGISTRATION_JSP).forward(request, response);
        logger.debug("Exiting doGet() method in RegistrationServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in RegistrationServlet");

        String userType = request.getParameter("userType");
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        logger.debug("Received registration details - Username: {}, Email: {}, UserType: {}", userName, email, userType);

        if (userName == null || email == null || password == null || userType == null) {
            logger.warn("Registration failed: Missing fields in registration form.");
            request.setAttribute("RegistererrorMessage", "All fields are required.");
            request.getRequestDispatcher(LOGIN_REGISTRATION_JSP).forward(request, response);
            logger.debug("Exiting doPost() method in RegistrationServlet");
            return;
        }
        
     // Email and Password validation
        if (email == null || !RegistrationHelper.isValidEmail(email)) {
            logger.warn("Invalid email format provided: {}", email);
            forwardWithError(request, response, "Please enter a valid email address.");
            return;
        }

        if (password == null || !RegistrationHelper.isValidPassword(password)) {
            logger.warn("Invalid password criteria for email: {}", email);
            forwardWithError(request, response, "Password must be at least 6 characters long and include an uppercase letter, a number, and a special character.");
            return;
        }

        String hashedPassword = BCryptPasswordUtil.hashPassword(password);

        LoginEntity registration = new LoginEntity();
        registration.setEmail(email);
        registration.setUserName(userName);
        registration.setFirstLogin(true);
        registration.setPassword(hashedPassword);
        registration.setRole(userType);

        try {
            if (loginService.emailExists(registration.getEmail())) {
                logger.warn("Registration failed: Email already exists - {}", email);
                forwardWithError(request, response, "Email already exists. Please use a different email.");
                return;
            }

            if (loginService.usernameExists(registration.getUserName())) {
                logger.warn("Registration failed: Username already exists - {}", userName);
                forwardWithError(request, response, "Username already exists. Please choose a different username.");
                return;
            }

            boolean result = loginService.saveLogin(registration);
            if (result) {
                logger.info("Registration successful for user: {}", userName);
                response.sendRedirect("LoginAndRegistration/user-login.jsp");
            } else {
                logger.error("Registration failed: Unable to save user to database.");
                response.sendRedirect(ERROR_PAGE);
            }
        } catch (Exception e) {
            logger.error("Error during registration: ", e);
            forwardWithError(request, response, "An unexpected error occurred. Please try again later.");
        }

        logger.debug("Exiting doPost() method in RegistrationServlet");
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        logger.debug("Forwarding with error message: {}", errorMessage);
        request.setAttribute("RegistererrorMessage", errorMessage);
        request.getRequestDispatcher(LOGIN_REGISTRATION_JSP).forward(request, response);
    }
}
