package com.revshop.controllers;

import java.io.IOException;

import org.apache.log4j.Logger;

import com.revature.helper.RegistrationHelper;
import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.UserEntity;
import com.revshop.service.LoginService;
import com.revshop.service.UserService;
import com.revshop.service.impl.LoginServiceIMPL;
import com.revshop.service.impl.UserServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DetailRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(DetailRegistrationServlet.class);

    public DetailRegistrationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doGet() method in DetailRegistrationServlet");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        logger.debug("Exiting doGet() method in DetailRegistrationServlet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in DetailRegistrationServlet");

        HttpSession session = request.getSession();
        LoginService loginservice = LoginServiceIMPL.getInstance();
        LoginEntity user = (LoginEntity) session.getAttribute("user");

        if (user != null) {
            logger.debug("User is logged in: " + user);

            try {
                String userId = request.getParameter("userId");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String gender = request.getParameter("gender");
                String mobile = request.getParameter("mobile");
                String pincode = request.getParameter("pincode");
                String billingAddress = request.getParameter("billingAddress");
                String companyName = request.getParameter("companyName");
                String gstNumber = request.getParameter("gstNumber");
                String websiteUrl = request.getParameter("websiteUrl");
                String panNumber = request.getParameter("panNumber");
                String bankAccountNo = request.getParameter("bankAccountNo");
                String ifsc = request.getParameter("ifsc");

                // Validate input fields
                if (!RegistrationHelper.isValidName(firstName)) {
                    forwardWithError(request, response, "Invalid first name. Please enter a valid name.");
                    return;
                }

                if (!RegistrationHelper.isValidName(lastName)) {
                    forwardWithError(request, response, "Invalid last name. Please enter a valid name.");
                    return;
                }

                if (!RegistrationHelper.isValidMobile(mobile)) {
                    forwardWithError(request, response, "Invalid mobile number. Please enter a 10-digit mobile number.");
                    return;
                }

                if (!RegistrationHelper.isValidPincode(pincode)) {
                    forwardWithError(request, response, "Invalid pincode. Please enter a 6-digit pincode.");
                    return;
                }

                if (!RegistrationHelper.isValidAddress(billingAddress)) {
                    forwardWithError(request, response, "Invalid billing address. Please enter a valid address.");
                    return;
                }

                if (companyName != null && !companyName.trim().isEmpty()) {
                    if (!RegistrationHelper.isValidGSTNumber(gstNumber)) {
                        forwardWithError(request, response, "Invalid GST number. Please enter a valid 15-digit GST number.");
                        return;
                    }

                    if (!RegistrationHelper.isValidURL(websiteUrl)) {
                        forwardWithError(request, response, "Invalid website URL. Please enter a valid URL.");
                        return;
                    }

                    if (!RegistrationHelper.isValidPAN(panNumber)) {
                        forwardWithError(request, response, "Invalid PAN number. Please enter a valid PAN number.");
                        return;
                    }

                    if (!RegistrationHelper.isValidBankAccount(bankAccountNo)) {
                        forwardWithError(request, response, "Invalid bank account number. Please enter a valid account number.");
                        return;
                    }

                    if (!RegistrationHelper.isValidIFSC(ifsc)) {
                        forwardWithError(request, response, "Invalid IFSC code. Please enter a valid IFSC code.");
                        return;
                    }
                }

                // If all validations pass, proceed with updating the user details
                UserEntity userEntity = new UserEntity();
                userEntity.setUserId(Integer.parseInt(userId));
                userEntity.setFirstName(firstName);
                userEntity.setLastName(lastName);
                userEntity.setGender(gender);
                userEntity.setMobile(mobile);
                userEntity.setPincode(pincode);
                userEntity.setBillingAddress(billingAddress);
                userEntity.setCompanyName(companyName);
                userEntity.setGstNumber(gstNumber);
                userEntity.setWebsiteUrl(websiteUrl);
                userEntity.setPanNumber(panNumber);
                userEntity.setBankAccountNo(bankAccountNo);
                userEntity.setIfsc(ifsc);

                UserService userService = new UserServiceIMPL();
                boolean isUpdated = userService.updateUserDetails(userEntity);
                logger.debug("User details update status: " + isUpdated);

                if (isUpdated) {
                    user.setFirstLogin(false);
                    loginservice.updateFirstLoginFlag(user.getEmail());
                    logger.debug("First login flag updated for user: " + user.getEmail());

                    session.setAttribute("user", user);
                    response.sendRedirect("HomeServlet");
                    logger.debug("User redirected to HomeServlet");
                } else {
                    logger.error("User details update failed for user: " + user.getEmail());
                    request.setAttribute("RegistererrorMessage", "Update failed. Please try again.");
                    request.getRequestDispatcher("LoginAndRegistration/detail-registration.jsp").forward(request, response);
                }
            } catch (Exception e) {
                logger.error("An error occurred during the user details update process", e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
            }
        } else {
            logger.warn("User is not logged in, redirecting to login page.");
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
        }

        logger.debug("Exiting doPost() method in DetailRegistrationServlet");
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        logger.debug("Forwarding with error message: " + errorMessage);
        request.setAttribute("RegistererrorMessage", errorMessage);
        request.getRequestDispatcher("LoginAndRegistration/detail-registration.jsp").forward(request, response);
    }
}
