package com.revshop.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.ReviewEntity;
import com.revshop.dao.ReviewDAO;
import com.revshop.service.ReviewService;

public class ReviewServiceIMPL implements ReviewService {

    private static final Logger logger = LoggerFactory.getLogger(ReviewServiceIMPL.class); // Logger instance
    private ReviewDAO reviewDAO;

    public ReviewServiceIMPL() {
        this.reviewDAO = new ReviewDAO();
    }

    @Override
    public boolean addReview(ReviewEntity review) {
        logger.debug("Adding review for product ID: {}", review.getProductId());
        try {
            boolean result = reviewDAO.insert(review);
            if (result) {
                logger.info("Review added successfully for product ID: {}", review.getProductId());
            } else {
                logger.error("Failed to add review for product ID: {}", review.getProductId());
            }
            return result;
        } catch (SQLException e) {
            logger.error("Error adding review for product ID: {}", review.getProductId(), e);
            return false;
        }
    }

    @Override
    public List<ReviewEntity> getReviewsByProductId(int productId) {
        logger.debug("Retrieving reviews for product ID: {}", productId);
        try {
            List<ReviewEntity> reviews = reviewDAO.getReviewsByProductId(productId);
            logger.info("Retrieved {} reviews for product ID: {}", reviews.size(), productId);
            return reviews;
        } catch (SQLException e) {
            logger.error("Error retrieving reviews for product ID: {}", productId, e);
            return null;
        }
    }
}
