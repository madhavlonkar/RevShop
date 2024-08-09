package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.revshop.dto.RegistrationDTO;
import com.revshop.utility.DBConnection;

public class RegistrationDAO {

    private static final String INSERT_LOGIN_SQL = "INSERT INTO tbl_login (username, email, password, isFirstLogin, role, userid) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String CHECK_EMAIL_SQL = "SELECT COUNT(*) FROM tbl_login WHERE email = ?";
    private static final String CHECK_USERNAME_SQL = "SELECT COUNT(*) FROM tbl_login WHERE username = ?";
    private static final String INSERT_USER_BASIC = "INSERT INTO tbl_user (email) VALUES (?)";

    public boolean saveLogin(RegistrationDTO loginDTO) {
        boolean isSaved = false;
        Connection connection = null;
        PreparedStatement loginPreparedStatement = null;
        PreparedStatement userPreparedStatement = null;
        ResultSet generatedKeys = null;

        try {
            connection = DBConnection.getConnection();
            connection.setAutoCommit(false);

            // Insert into tbl_user and get the generated user_id
            userPreparedStatement = connection.prepareStatement(INSERT_USER_BASIC, Statement.RETURN_GENERATED_KEYS);
            userPreparedStatement.setString(1, loginDTO.getEmail());
            int userResult = userPreparedStatement.executeUpdate();

            if (userResult > 0) {
                generatedKeys = userPreparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1); // Get the generated user_id

                    // Insert into tbl_login with the retrieved user_id
                    loginPreparedStatement = connection.prepareStatement(INSERT_LOGIN_SQL);
                    loginPreparedStatement.setString(1, loginDTO.getUserName());
                    loginPreparedStatement.setString(2, loginDTO.getEmail());
                    loginPreparedStatement.setString(3, loginDTO.getPassword());
                    loginPreparedStatement.setBoolean(4, loginDTO.isFirstLogin());
                    loginPreparedStatement.setString(5, loginDTO.getRole());
                    loginPreparedStatement.setInt(6, userId);

                    int loginResult = loginPreparedStatement.executeUpdate();

                    if (loginResult > 0) {
                        isSaved = true;
                        connection.commit();
                    } else {
                        connection.rollback();
                    }
                }
            } else {
                connection.rollback();
            }

        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            System.out.println("Error saving registration details: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) {
                try {
                    generatedKeys.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (loginPreparedStatement != null) {
                try {
                    loginPreparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (userPreparedStatement != null) {
                try {
                    userPreparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return isSaved;
    }

    public boolean emailExists(String email) {
        boolean exists = false;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_SQL)) {

            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    exists = resultSet.getInt(1) > 0;
                }
            }

        } catch (SQLException e) {
            System.out.println("Error checking if email exists: " + e.getMessage());
            e.printStackTrace();
        }

        return exists;
    }

    public boolean usernameExists(String username) {
        boolean exists = false;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USERNAME_SQL)) {

            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    exists = resultSet.getInt(1) > 0;
                }
            }

        } catch (SQLException e) {
            System.out.println("Error checking if username exists: " + e.getMessage());
            e.printStackTrace();
        }

        return exists;
    }
}
