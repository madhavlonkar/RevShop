package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.Entity;
import com.revshop.Entity.ReviewEntity;
import com.revshop.utility.DBConnection;

public class ReviewDAO implements DAO {

    private static final Logger logger = LoggerFactory.getLogger(ReviewDAO.class);

    private static final String INSERT_REVIEW_SQL = 
        "INSERT INTO tbl_review (review, stars, productId, userId, customerName, customerEmail, reviewDate) VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_REVIEWS_BY_PRODUCT_ID = 
        "SELECT * FROM tbl_review WHERE productId = ?";

    @Override
    public boolean insert(Entity entity) throws SQLException {
        if (!(entity instanceof ReviewEntity)) {
            logger.warn("Entity provided is not an instance of ReviewEntity");
            return false;
        }

        ReviewEntity review = (ReviewEntity) entity;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REVIEW_SQL)) {

            // Set the parameters for the prepared statement
            preparedStatement.setString(1, review.getReview());
            preparedStatement.setInt(2, review.getStars());
            preparedStatement.setInt(3, review.getProductId());
            preparedStatement.setInt(4, review.getUserId());
            preparedStatement.setString(5, review.getCustomerName());
            preparedStatement.setString(6, review.getCustomerEmail());
            preparedStatement.setDate(7, new java.sql.Date(review.getReviewDate().getTime()));

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                logger.info("Review inserted successfully for product ID: {}", review.getProductId());
                return true;
            } else {
                logger.warn("Failed to insert review for product ID: {}", review.getProductId());
                return false;
            }
        } catch (SQLException e) {
            logger.error("Error inserting review for product ID: {}", review.getProductId(), e);
            throw e;
        }
    }

    public List<ReviewEntity> getReviewsByProductId(int productId) throws SQLException {
        List<ReviewEntity> reviews = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVIEWS_BY_PRODUCT_ID)) {

            preparedStatement.setInt(1, productId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    ReviewEntity review = new ReviewEntity();
                    review.setReviewId(resultSet.getInt("review_id"));
                    review.setReview(resultSet.getString("review"));
                    review.setStars(resultSet.getInt("stars"));
                    review.setProductId(resultSet.getInt("productId"));
                    review.setUserId(resultSet.getInt("userId"));
                    review.setCustomerName(resultSet.getString("customerName"));
                    review.setCustomerEmail(resultSet.getString("customerEmail"));
                    review.setReviewDate(resultSet.getDate("reviewDate"));

                    reviews.add(review);
                }
            }
            logger.info("Retrieved {} reviews for product ID: {}", reviews.size(), productId);
        } catch (SQLException e) {
            logger.error("Error retrieving reviews for product ID: {}", productId, e);
            throw e;
        }

        return reviews;
    }

    @Override
    public boolean update(Entity entity) throws SQLException {
        // Implement the update logic if required
        logger.warn("Update method is not implemented");
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        // Implement the delete logic if required
        logger.warn("Delete method is not implemented");
        return false;
    }

    @Override
    public Entity retrieveById(int id) throws SQLException {
        // Implement the retrieve by ID logic if required
        logger.warn("Retrieve by ID method is not implemented");
        return null;
    }

    @Override
    public List<Entity> retrieveAll() throws SQLException {
        // Implement the retrieve all logic if required
        logger.warn("Retrieve all method is not implemented");
        return null;
    }
}
