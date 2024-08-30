package com.revshop.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.LoginEntity;
import com.revshop.dao.LoginDAO;
import com.revshop.service.LoginService;
import com.revshop.utility.BCryptPasswordUtil;

public class LoginServiceIMPL implements LoginService {

    private static final Logger logger = LoggerFactory.getLogger(LoginServiceIMPL.class); // Logger instance
    private final LoginDAO logindao = LoginDAO.getInstance();
    
    private static LoginServiceIMPL instance;
    
    private LoginServiceIMPL() {}

    public static LoginServiceIMPL getInstance() {
        if (instance == null) { // First check
            synchronized (LoginServiceIMPL.class) { // Lock class object
                if (instance == null) { // Second check
                    instance = new LoginServiceIMPL(); // Create instance
                }
            }
        }
        return instance;
    }

    @Override
    public boolean saveLogin(LoginEntity login) {
        logger.debug("Saving login details for user: {}", login.getEmail());
        try {
            boolean result = logindao.insert(login);
            if (result) {
                logger.info("Successfully saved login details for user: {}", login.getEmail());
            } else {
                logger.error("Failed to save login details for user: {}", login.getEmail());
            }
            return result;
        } catch (Exception e) {
            logger.error("Error saving login details for user: {}", login.getEmail(), e);
            return false;
        }
    }

    @Override
    public boolean emailExists(String email) {
        logger.debug("Checking if email exists: {}", email);
        try {
            boolean exists = logindao.findByEmail(email) != null;
            logger.info("Email {} exists: {}", email, exists);
            return exists;
        } catch (Exception e) {
            logger.error("Error checking if email exists: {}", email, e);
            return false;
        }
    }

    @Override
    public boolean usernameExists(String username) {
        logger.debug("Checking if username exists: {}", username);
        try {
            boolean exists = logindao.findByUsername(username) != null;
            logger.info("Username {} exists: {}", username, exists);
            return exists;
        } catch (Exception e) {
            logger.error("Error checking if username exists: {}", username, e);
            return false;
        }
    }

    @Override
    public boolean validate(String email, String password) {
        logger.debug("Validating user with email: {}", email);
        try {
            LoginEntity loginDetails = logindao.findByEmail(email);
            if (loginDetails == null) {
                logger.warn("User not found with email: {}", email);
                return false; // Email does not exist
            }

            String storedHashedPassword = loginDetails.getPassword();
            boolean isValid = BCryptPasswordUtil.checkPassword(password, storedHashedPassword);
            logger.info("Password validation for email {}: {}", email, isValid);
            return isValid;
        } catch (Exception e) {
            logger.error("Error validating user with email: {}", email, e);
            return false;
        }
    }
    
    @Override
    public LoginEntity findByEmail(String email) {
        logger.debug("Finding user by email: {}", email);
        try {
            LoginEntity user = logindao.findByEmail(email);
            if (user != null) {
                logger.info("User found with email: {}", email);
            } else {
                logger.warn("User not found with email: {}", email);
            }
            return user;
        } catch (Exception e) {
            logger.error("Error finding user by email: {}", email, e);
            return null;
        }
    }

    @Override
    public boolean updateFirstLoginFlag(String email) {
        logger.debug("Updating first login flag for user with email: {}", email);
        try {
            LoginEntity user = findByEmail(email);
            if (user == null) {
                logger.warn("User not found for updating first login flag with email: {}", email);
                return false;
            }
            user.setFirstLogin(false);
            boolean result = logindao.update(user);
            if (result) {
                logger.info("Successfully updated first login flag for user with email: {}", email);
            } else {
                logger.error("Failed to update first login flag for user with email: {}", email);
            }
            return result;
        } catch (Exception e) {
            logger.error("Error updating first login flag for user with email: {}", email, e);
            return false;
        }
    }
}
