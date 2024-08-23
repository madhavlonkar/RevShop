package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.revshop.Entity.Entity;
import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.UserEntity;
import com.revshop.utility.DBConnection;

public class UserDAO implements DAO {

    private static final String INSERT_USER_BASIC = "INSERT INTO tbl_user (email) VALUES (?)";
    private static final String INSERT_USER_FULL = "INSERT INTO tbl_user (firstName, lastName, gender, mobile, email, pincode, billingAddress, shippingAddress, bankAccountNo, ifsc, companyName, gstNumber, websiteUrl, productType, panNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_USER = "UPDATE tbl_user SET firstName = ?, lastName = ?, gender = ?, mobile = ?, pincode = ?, billingAddress = ?, shippingAddress = ?, bankAccountNo = ?, ifsc = ?, companyName = ?, gstNumber = ?, websiteUrl = ?, productType = ?, panNumber = ? WHERE userId = ?";


    // Singleton instance
    private static UserDAO instance;

    // Private constructor to prevent instantiation
    private UserDAO() {}

    // Public method to provide access to the singleton instance
    public static UserDAO getInstance() {
        if (instance == null) {
            synchronized (UserDAO.class) {
                if (instance == null) {
                    instance = new UserDAO();
                }
            }
        }
        return instance;
    }

    @Override
    public boolean insert(Entity entity) {
        // Cast the entity to UserEntity
        UserEntity user = (UserEntity) entity;
        int result = 0;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_FULL, Statement.RETURN_GENERATED_KEYS)) {

            connection.setAutoCommit(false);

            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setString(4, user.getMobile());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(6, user.getPincode());
            preparedStatement.setString(7, user.getBillingAddress());
            preparedStatement.setString(8, user.getShippingAddress());
            preparedStatement.setString(9, user.getBankAccountNo());
            preparedStatement.setString(10, user.getIfsc());
            preparedStatement.setString(11, user.getCompanyName());
            preparedStatement.setString(12, user.getGstNumber());
            preparedStatement.setString(13, user.getWebsiteUrl());
            preparedStatement.setString(14, user.getProductType());
            preparedStatement.setString(15, user.getPanNumber());

            result = preparedStatement.executeUpdate();

            if (result > 0) {
                connection.commit();
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        user.setUserId(generatedKeys.getInt(1));
                    }
                }
            } else {
                connection.rollback();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try (Connection connection = DBConnection.getConnection()) {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }

        return result > 0;
    }

    @Override
    public boolean update(Entity entity) {
        // Cast the entity to UserEntity
        UserEntity user = (UserEntity) entity;
        int result = 0;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {

            connection.setAutoCommit(false);

            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setString(4, user.getMobile());
            preparedStatement.setString(5, user.getPincode());
            preparedStatement.setString(6, user.getBillingAddress());
            preparedStatement.setString(7, user.getShippingAddress());
            preparedStatement.setString(8, user.getBankAccountNo());
            preparedStatement.setString(9, user.getIfsc());
            preparedStatement.setString(10, user.getCompanyName());
            preparedStatement.setString(11, user.getGstNumber());
            preparedStatement.setString(12, user.getWebsiteUrl());
            preparedStatement.setString(13, user.getProductType());
            preparedStatement.setString(14, user.getPanNumber());
            preparedStatement.setInt(15, user.getUserId());

            result = preparedStatement.executeUpdate();

            if (result > 0) {
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try (Connection connection = DBConnection.getConnection()) {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }

        return result > 0;
    }

    @Override
    public boolean delete(int id) {
        // Implementation to be provided
        return false;
    }

    @Override
    public Entity retrieveById(int id) {
        // Implementation to be provided
        return null;
    }

    @Override
    public List<Entity> retrieveAll() {
        // Implementation to be provided
        return null;
    }

    public int initialInsertAndGetKeys(Entity entity) {
        int userId = -1;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement userPreparedStatement = connection.prepareStatement(INSERT_USER_BASIC, Statement.RETURN_GENERATED_KEYS)) {

            connection.setAutoCommit(false);

            LoginEntity register = (LoginEntity) entity;
            userPreparedStatement.setString(1, register.getEmail());

            int userResult = userPreparedStatement.executeUpdate();

            if (userResult > 0) {
                try (ResultSet generatedKeys = userPreparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userId = generatedKeys.getInt(1);
                    }
                }
                connection.commit(); // Commit the transaction after successfully getting the keys
            } else {
                connection.rollback(); // Rollback if user insertion failed
            }

        } catch (SQLException e) {
            System.err.println("Error saving registration details: " + e.getMessage());
            e.printStackTrace();
            try (Connection connection = DBConnection.getConnection()) {
                connection.rollback(); // Rollback on exception
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return userId; // Return the generated user ID
    }
}
