package com.revature.test;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.ReviewEntity;
import com.revshop.dao.ReviewDAO;
import com.revshop.service.impl.ReviewServiceIMPL;

public class ReviewServiceIMPLTest {

    @InjectMocks
    private ReviewServiceIMPL reviewService;

    @Mock
    private ReviewDAO reviewDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddReview_Success() throws SQLException {
        ReviewEntity review = new ReviewEntity();
        review.setProductId(1);
        review.setReview("Great product!");

        when(reviewDAO.insert(review)).thenReturn(true);

        boolean result = reviewService.addReview(review);

        assertTrue(result);
        verify(reviewDAO, times(1)).insert(review);
    }

    @Test
    void testAddReview_Failure() throws SQLException {
        ReviewEntity review = new ReviewEntity();
        review.setProductId(1);
        review.setReview("Great product!");

        when(reviewDAO.insert(review)).thenReturn(false);

        boolean result = reviewService.addReview(review);

        assertFalse(result);
        verify(reviewDAO, times(1)).insert(review);
    }

    @Test
    void testGetReviewsByProductId_Success() throws SQLException {
        int productId = 1;
        ReviewEntity review1 = new ReviewEntity();
        review1.setProductId(productId);
        review1.setReview("Great product!");

        ReviewEntity review2 = new ReviewEntity();
        review2.setProductId(productId);
        review2.setReview("Not bad!");

        when(reviewDAO.getReviewsByProductId(productId)).thenReturn(Arrays.asList(review1, review2));

        List<ReviewEntity> reviews = reviewService.getReviewsByProductId(productId);

        assertNotNull(reviews);
        assertEquals(2, reviews.size());
        verify(reviewDAO, times(1)).getReviewsByProductId(productId);
    }

    @Test
    void testGetReviewsByProductId_Failure() throws SQLException {
        int productId = 1;

        when(reviewDAO.getReviewsByProductId(productId)).thenThrow(SQLException.class);

        List<ReviewEntity> reviews = reviewService.getReviewsByProductId(productId);

        assertNull(reviews);
        verify(reviewDAO, times(1)).getReviewsByProductId(productId);
    }
}
