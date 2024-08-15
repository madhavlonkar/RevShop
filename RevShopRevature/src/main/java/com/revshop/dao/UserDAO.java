package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.revshop.Entity.Entity;
import com.revshop.Entity.LoginEntity;
import com.revshop.utility.DBConnection;

public class UserDAO implements DAO {

    private static final String INSERT_USER_BASIC = "INSERT INTO tbl_user (email) VALUES (?)";

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
        // Implementation to be provided
        return false;
    }

    @Override
    public boolean update(Entity entity) {
        // Implementation to be provided
        return false;
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
