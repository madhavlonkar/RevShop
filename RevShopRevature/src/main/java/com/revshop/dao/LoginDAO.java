package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.Entity;
import com.revshop.Entity.LoginEntity;
import com.revshop.utility.DBConnection;

public class LoginDAO implements DAO {

    private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class); // Logger instance

    private static final String INSERT_LOGIN_SQL = "INSERT INTO tbl_login (username, email, password, isFirstLogin, role, userid) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String CHECK_EMAIL_SQL = "SELECT * FROM tbl_login WHERE email = ?";
    private static final String CHECK_USERNAME_SQL = "SELECT * FROM tbl_login WHERE username = ?";

    // Singleton instance
    private static LoginDAO instance;

    // UserDAO instance
    private UserDAO rd = UserDAO.getInstance();

    // Private constructor to prevent instantiation
    private LoginDAO() {}

    // Public method to provide access to the singleton instance
    public static LoginDAO getInstance() {
        if (instance == null) {
            synchronized (LoginDAO.class) {
                if (instance == null) {
                    instance = new LoginDAO();
                }
            }
        }
        return instance;
    }

    @Override
    public boolean insert(Entity entity) {
        logger.debug("Inserting new login entity");
        boolean isSaved = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement loginPreparedStatement = connection.prepareStatement(INSERT_LOGIN_SQL)) {

            connection.setAutoCommit(false);
            LoginEntity login = (LoginEntity) entity;

            // Get the userId by inserting the basic information into tbl_user
            int userId = rd.initialInsertAndGetKeys(login);

            if (userId != -1) {
                // Insert login details using the generated userId
                loginPreparedStatement.setString(1, login.getUserName());
                loginPreparedStatement.setString(2, login.getEmail());
                loginPreparedStatement.setString(3, login.getPassword());
                loginPreparedStatement.setBoolean(4, login.isFirstLogin());
                loginPreparedStatement.setString(5, login.getRole());
                loginPreparedStatement.setInt(6, userId);

                int loginResult = loginPreparedStatement.executeUpdate();
                if (loginResult > 0) {
                    isSaved = true;
                    connection.commit(); // Commit if successful
                    logger.info("Login entity inserted successfully for user ID: {}", userId);
                } else {
                    connection.rollback(); // Rollback if unsuccessful
                    logger.error("Failed to insert login entity for user ID: {}", userId);
                }
            } else {
                connection.rollback(); // Rollback if user ID generation failed
                logger.error("Failed to generate user ID for login entity");
            }

        } catch (SQLException e) {
            logger.error("Error inserting login entity", e);
        }
        return isSaved;
    }

    @Override
    public boolean update(Entity entity) {
        logger.debug("Updating login entity");
        LoginEntity loginEntity = (LoginEntity) entity;
        String query = "UPDATE tbl_login SET email = ?, password = ?, isFirstLogin = ?, role = ?, username = ? WHERE loginId = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, loginEntity.getEmail());
            preparedStatement.setString(2, loginEntity.getPassword());
            preparedStatement.setBoolean(3, loginEntity.isFirstLogin());
            preparedStatement.setString(4, loginEntity.getRole());
            preparedStatement.setString(5, loginEntity.getUserName());
            preparedStatement.setInt(6, loginEntity.getLoginId());

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                logger.info("Login entity updated successfully for login ID: {}", loginEntity.getLoginId());
            } else {
                logger.error("Failed to update login entity for login ID: {}", loginEntity.getLoginId());
            }
            return result > 0;

        } catch (SQLException e) {
            logger.error("Error updating login entity for login ID: {}", loginEntity.getLoginId(), e);
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Entity retrieveById(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Entity> retrieveAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public LoginEntity findByEmail(String email) {
        logger.debug("Finding login entity by email: {}", email);
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL_SQL)) {

            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    LoginEntity loginEntity = extractLoginEntity(resultSet);
                    logger.info("Login entity found for email: {}", email);
                    return loginEntity;
                } else {
                    logger.warn("No login entity found for email: {}", email);
                }
            }
        } catch (SQLException e) {
            logger.error("Error finding login entity by email: {}", email, e);
        }
        return null;
    }

    public LoginEntity findByUsername(String username) {
        logger.debug("Finding login entity by username: {}", username);
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USERNAME_SQL)) {

            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    LoginEntity loginEntity = extractLoginEntity(resultSet);
                    logger.info("Login entity found for username: {}", username);
                    return loginEntity;
                } else {
                    logger.warn("No login entity found for username: {}", username);
                }
            }
        } catch (SQLException e) {
            logger.error("Error finding login entity by username: {}", username, e);
        }
        return null;
    }

    // Extracts a LoginEntity object from a ResultSet
    private LoginEntity extractLoginEntity(ResultSet resultSet) throws SQLException {
        LoginEntity loginEntity = new LoginEntity();
        loginEntity.setLoginId(resultSet.getInt("loginId"));  // Extracting loginId from ResultSet
        loginEntity.setUserName(resultSet.getString("username"));
        loginEntity.setEmail(resultSet.getString("email"));
        loginEntity.setPassword(resultSet.getString("password"));
        loginEntity.setFirstLogin(resultSet.getBoolean("isFirstLogin"));
        loginEntity.setRole(resultSet.getString("role"));
        loginEntity.setUserId(resultSet.getInt("userid"));
        return loginEntity;
    }
}
