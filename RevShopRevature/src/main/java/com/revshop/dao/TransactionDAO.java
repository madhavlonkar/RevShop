package com.revshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.Entity;
import com.revshop.Entity.TransactionEntity;
import com.revshop.utility.DBConnection;

public class TransactionDAO implements DAO {

    private static final Logger logger = LoggerFactory.getLogger(TransactionDAO.class);

    @Override
    public boolean insert(Entity entity) {
        if (!(entity instanceof TransactionEntity)) {
            logger.warn("Attempted to insert an entity that is not a TransactionEntity");
            return false;
        }

        TransactionEntity transaction = (TransactionEntity) entity;

        String query = "INSERT INTO tbl_transcations (transcation_id, orderId, amount, userId, sellerId) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, transaction.getTransactionId());
            stmt.setString(2, transaction.getOrderId());
            stmt.setDouble(3, transaction.getAmount());
            stmt.setInt(4, transaction.getUserId());
            stmt.setInt(5, transaction.getSellerId());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                logger.info("Transaction inserted successfully with transaction ID: {}", transaction.getTransactionId());
                return true;
            } else {
                logger.warn("Failed to insert transaction with transaction ID: {}", transaction.getTransactionId());
                return false;
            }

        } catch (SQLException e) {
            logger.error("Error inserting transaction with transaction ID: {}", transaction.getTransactionId(), e);
            return false;
        }
    }

    @Override
    public boolean update(Entity entity) {
        logger.warn("Update method is not implemented");
        return false;
    }

    @Override
    public boolean delete(int id) {
        logger.warn("Delete method is not implemented");
        return false;
    }

    @Override
    public Entity retrieveById(int id) {
        logger.warn("Retrieve by ID method is not implemented");
        return null;
    }

    @Override
    public List<Entity> retrieveAll() {
        logger.warn("Retrieve all method is not implemented");
        return null;
    }
}
