package com.revshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.Entity;
import com.revshop.Entity.ProductEntity;
import com.revshop.dao.ProductDAO;
import com.revshop.service.ProductService;

public class ProductServiceIMPL implements ProductService {

    private static final Logger logger = LoggerFactory.getLogger(ProductServiceIMPL.class); // Logger instance

    private ProductDAO pdao = ProductDAO.getInstance();

    @Override
    public boolean saveProduct(ProductEntity entity) {
        logger.debug("Saving product: {}", entity.getProductName());
        try {
            boolean result = pdao.insert(entity);
            if (result) {
                logger.info("Product saved successfully: {}", entity.getProductName());
            } else {
                logger.error("Failed to save product: {}", entity.getProductName());
            }
            return result;
        } catch (Exception e) {
            logger.error("Error saving product: {}", entity.getProductName(), e);
            return false;
        }
    }

    @Override
    public List<ProductEntity> getAllProducts() {
        logger.debug("Retrieving all products");
        List<Entity> entities = pdao.retrieveAll();
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Retrieved {} products", products.size());
        return products;
    }

    @Override
    public boolean deleteProduct(int id) {
        logger.debug("Deleting product with ID: {}", id);
        try {
            boolean result = pdao.delete(id);
            if (result) {
                logger.info("Product with ID {} deleted successfully", id);
            } else {
                logger.error("Failed to delete product with ID: {}", id);
            }
            return result;
        } catch (Exception e) {
            logger.error("Error deleting product with ID: {}", id, e);
            return false;
        }
    }

    @Override
    public ProductEntity getProductById(int id) {
        logger.debug("Retrieving product by ID: {}", id);
        try {
            Entity entity = pdao.retrieveById(id);
            if (entity instanceof ProductEntity) {
                logger.info("Product with ID {} retrieved successfully", id);
                return (ProductEntity) entity;
            } else {
                logger.warn("No product found with ID: {}", id);
                return null;
            }
        } catch (Exception e) {
            logger.error("Error retrieving product by ID: {}", id, e);
            return null;
        }
    }

    @Override
    public boolean updateProduct(ProductEntity entity) {
        logger.debug("Updating product: {}", entity.getProductName());
        try {
            boolean result = pdao.update(entity);
            if (result) {
                logger.info("Product updated successfully: {}", entity.getProductName());
            } else {
                logger.error("Failed to update product: {}", entity.getProductName());
            }
            return result;
        } catch (Exception e) {
            logger.error("Error updating product: {}", entity.getProductName(), e);
            return false;
        }
    }

    @Override
    public List<ProductEntity> getProductsByCategory(String category) {
        logger.debug("Retrieving products by category: {}", category);
        List<Entity> entities = pdao.retrieveByCategory(category);
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Retrieved {} products in category: {}", products.size(), category);
        return products;
    }

    @Override
    public List<ProductEntity> searchProducts(String keyword) {
        logger.debug("Searching products with keyword: {}", keyword);
        List<Entity> entities = pdao.searchProducts(keyword);
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Found {} products matching keyword: {}", products.size(), keyword);
        return products;
    }

    @Override
    public List<ProductEntity> getProductsBySellerId(int sellerId) {
        logger.debug("Retrieving products by seller ID: {}", sellerId);
        List<Entity> entities = pdao.retrieveBySellerId(sellerId);
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Retrieved {} products for seller ID: {}", products.size(), sellerId);
        return products;
    }

    @Override
    public List<ProductEntity> getProductsByCategoryAndSeller(String category, int sellerId) {
        logger.debug("Retrieving products by category: {} and seller ID: {}", category, sellerId);
        List<Entity> entities = pdao.retrieveByCategoryAndSeller(category, sellerId);
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Retrieved {} products in category: {} for seller ID: {}", products.size(), category, sellerId);
        return products;
    }

    @Override
    public List<ProductEntity> searchProductsBySeller(String keyword, int sellerId) {
        logger.debug("Searching products with keyword: {} for seller ID: {}", keyword, sellerId);
        List<Entity> entities = pdao.searchProductsBySeller(keyword, sellerId);
        List<ProductEntity> products = new ArrayList<>();

        for (Entity entity : entities) {
            if (entity instanceof ProductEntity) {
                products.add((ProductEntity) entity);
            }
        }

        logger.info("Found {} products matching keyword: {} for seller ID: {}", products.size(), keyword, sellerId);
        return products;
    }

    @Override
    public List<ProductEntity> getLowStockProducts(int sellerId) {
        logger.debug("Retrieving low stock products for seller ID: {}", sellerId);
        try {
            List<ProductEntity> lowStockProducts = pdao.getProductsBelowThreshold(sellerId);
            logger.info("Retrieved {} low stock products for seller ID: {}", lowStockProducts.size(), sellerId);
            return lowStockProducts;
        } catch (Exception e) {
            logger.error("Error retrieving low stock products for seller ID: {}", sellerId, e);
            return new ArrayList<>();
        }
    }
}
