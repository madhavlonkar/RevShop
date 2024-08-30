package com.revshop.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.Entity;
import com.revshop.Entity.UserEntity;
import com.revshop.dao.UserDAO;
import com.revshop.service.UserService;

public class UserServiceIMPL implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceIMPL.class); // Logger instance

    private UserDAO userDAO;

    public UserServiceIMPL() {
        this.userDAO = UserDAO.getInstance();
    }

    @Override
    public boolean updateUserDetails(UserEntity user) {
        logger.debug("Updating user details for user ID: {}", user.getUserId());
        try {
            boolean result = userDAO.update((Entity) user);
            if (result) {
                logger.info("User details updated successfully for user ID: {}", user.getUserId());
            } else {
                logger.error("Failed to update user details for user ID: {}", user.getUserId());
            }
            return result;
        } catch (Exception e) {
            logger.error("Error updating user details for user ID: {}", user.getUserId(), e);
            return false;
        }
    }

    @Override
    public UserEntity getUserById(int userId) {
        logger.debug("Retrieving user details for user ID: {}", userId);
        try {
            UserEntity user = (UserEntity) userDAO.retrieveById(userId);
            if (user != null) {
                logger.info("User details retrieved successfully for user ID: {}", userId);
            } else {
                logger.warn("No user found with ID: {}", userId);
            }
            return user;
        } catch (Exception e) {
            logger.error("Error retrieving user details for user ID: {}", userId, e);
            return null;
        }
    }
}
