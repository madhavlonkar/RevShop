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
import com.revshop.Entity.ProductEntity;
import com.revshop.utility.DBConnection;

public class ProductDAO implements DAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class); // Updated to reference ProductDAO
	private static ProductDAO instance;

	private ProductDAO() {
	}

	public static ProductDAO getInstance() {
		if (instance == null) {
			synchronized (ProductDAO.class) {
				if (instance == null) {
					instance = new ProductDAO();
				}
			}
		}
		return instance;
	}

	private static final String INSERT_PRODUCT_QUERY = "INSERT INTO tbl_products(productName, productDescription, productPrice, productDiscount, productStock, productImage, productBrand, productCategory, productTags, productStatus, sellerId, threshold) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String RETRIEVE_ALL_QUERY = "SELECT * FROM tbl_products";
	private static final String RETRIEVE_BY_ID_QUERY = "SELECT * FROM tbl_products WHERE productId = ?";
	private static final String UPDATE_PRODUCT_QUERY = "UPDATE tbl_products SET productName = ?, productDescription = ?, productPrice = ?, productDiscount = ?, productStock = ?, productImage = ?, productBrand = ?, productCategory = ?, productTags = ?, productStatus = ? WHERE productId = ?";
	private static final String RETRIEVE_BY_CATEGORY_AND_SELLER_QUERY = "SELECT * FROM tbl_products WHERE productCategory = ? AND sellerId = ?";
	private static final String SEARCH_PRODUCTS_BY_SELLER_QUERY = "SELECT * FROM tbl_products WHERE (productName LIKE ? OR productDescription LIKE ? OR productBrand LIKE ? OR productTags LIKE ?) AND sellerId = ?";
	private static final String SEARCH_PRODUCTS_QUERY = "SELECT * FROM tbl_products WHERE productName LIKE ? OR productDescription LIKE ? OR productBrand LIKE ? OR productTags LIKE ?";
	private static final String RETRIEVE_BY_CATEGORY_QUERY = "SELECT * FROM tbl_products WHERE productCategory = ?";


	@Override
	public boolean insert(Entity entity) {
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(INSERT_PRODUCT_QUERY)) {

			ProductEntity product = (ProductEntity) entity;
			stmt.setString(1, product.getProductName());
			stmt.setString(2, product.getProductDescription());
			stmt.setDouble(3, product.getProductPrice());
			stmt.setDouble(4, product.getProductDiscount());
			stmt.setInt(5, product.getProductStock());
			stmt.setString(6, product.getProductImage());
			stmt.setString(7, product.getProductBrand());
			stmt.setString(8, product.getProductCategory());
			stmt.setString(9, product.getProductTags());
			stmt.setString(10, product.getProductStatus());
			stmt.setInt(11, product.getSellerId());
			stmt.setInt(12, product.getThreshold());

			int result = stmt.executeUpdate();
			if (result == 1) {
				logger.info("Product inserted successfully: {}", product.getProductName());
				return true;
			} else {
				logger.warn("Failed to insert product: {}", product.getProductName());
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error inserting product: {}", entity, e);
			return false;
		}
	}

	@Override
	public boolean update(Entity entity) {
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(UPDATE_PRODUCT_QUERY)) {

			ProductEntity product = (ProductEntity) entity;
			stmt.setString(1, product.getProductName());
			stmt.setString(2, product.getProductDescription());
			stmt.setDouble(3, product.getProductPrice());
			stmt.setDouble(4, product.getProductDiscount());
			stmt.setInt(5, product.getProductStock());
			stmt.setString(6, product.getProductImage());
			stmt.setString(7, product.getProductBrand());
			stmt.setString(8, product.getProductCategory());
			stmt.setString(9, product.getProductTags());
			stmt.setString(10, product.getProductStatus());
			stmt.setInt(11, product.getProductId());

			int result = stmt.executeUpdate();
			if (result == 1) {
				logger.info("Product updated successfully: {}", product.getProductName());
				return true;
			} else {
				logger.warn("Failed to update product: {}", product.getProductName());
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error updating product: {}", entity, e);
			return false;
		}
	}

	@Override
	public boolean delete(int id) {
		String DELETE_PRODUCT_QUERY = "DELETE FROM tbl_products WHERE productId = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(DELETE_PRODUCT_QUERY)) {

			stmt.setInt(1, id);

			int result = stmt.executeUpdate();
			if (result == 1) {
				logger.info("Product deleted successfully: {}", id);
				return true;
			} else {
				logger.warn("Failed to delete product with ID: {}", id);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error deleting product with ID: {}", id, e);
			return false;
		}
	}

	@Override
	public Entity retrieveById(int id) {
		ProductEntity product = null;
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(RETRIEVE_BY_ID_QUERY)) {

			stmt.setInt(1, id);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));
				}
			}
			if (product != null) {
				logger.info("Product retrieved successfully: {}", product.getProductName());
			} else {
				logger.warn("No product found with ID: {}", id);
			}
		} catch (SQLException e) {
			logger.error("Error retrieving product with ID: " + id, e);
		}
		return product;
	}

	@Override
	public List<Entity> retrieveAll() {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(RETRIEVE_ALL_QUERY);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				ProductEntity product = new ProductEntity();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setProductDescription(rs.getString("productDescription"));
				product.setProductPrice(rs.getDouble("productPrice"));
				product.setProductDiscount(rs.getDouble("productDiscount"));
				product.setProductStock(rs.getInt("productStock"));
				product.setProductImage(rs.getString("productImage"));
				product.setProductBrand(rs.getString("productBrand"));
				product.setProductCategory(rs.getString("productCategory"));
				product.setProductTags(rs.getString("productTags"));
				product.setProductStatus(rs.getString("productStatus"));

				products.add(product);
			}
			logger.info("Retrieved {} products from database.", products.size());
		} catch (SQLException e) {
			logger.error("Error retrieving all products", e);
		}
		return products;
	}

	public int getSellerIdByProductId(int productId) {
		String query = "SELECT sellerId FROM tbl_products WHERE productId = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setInt(1, productId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					logger.info("Seller ID retrieved for product ID: {}", productId);
					return rs.getInt("sellerId");
				}
			}
		} catch (SQLException e) {
			logger.error("Error retrieving seller ID for product ID: " + productId, e);
		}
		return -1;
	}

	public boolean updateProductStock(int productId, int quantitySold) {
		String query = "UPDATE tbl_products SET productStock = productStock - ? WHERE productId = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setInt(1, quantitySold);
			stmt.setInt(2, productId);

			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				logger.info("Product stock updated for product ID: {}", productId);
				return true;
			} else {
				logger.warn("Failed to update product stock for product ID: {}", productId);
				return false;
			}
		} catch (SQLException e) {
			logger.error("Error updating product stock for product ID: " + productId, e);
			return false;
		}
	}

	public List<Entity> retrieveByCategory(String category) {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(RETRIEVE_BY_CATEGORY_QUERY)) {

			stmt.setString(1, category);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));

					products.add(product);
				}
				logger.info("Retrieved {} products for category: {}", products.size(), category);
			}
		} catch (SQLException e) {
			logger.error("Error retrieving products by category", e);
		}
		return products;
	}

	public List<Entity> searchProducts(String keyword) {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(SEARCH_PRODUCTS_QUERY)) {

			String searchPattern = "%" + keyword + "%";
			stmt.setString(1, searchPattern);
			stmt.setString(2, searchPattern);
			stmt.setString(3, searchPattern);
			stmt.setString(4, searchPattern);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));

					products.add(product);
				}
				logger.info("Retrieved {} products for search keyword: {}", products.size(), keyword);
			}
		} catch (SQLException e) {
			logger.error("Error searching products with keyword: " + keyword, e);
		}
		return products;
	}

	public List<Entity> retrieveBySellerId(int sellerId) {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(SEARCH_PRODUCTS_BY_SELLER_QUERY )) {

			stmt.setInt(1, sellerId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));

					products.add(product);
				}
				logger.info("Retrieved {} products for seller ID: {}", products.size(), sellerId);
			}
		} catch (SQLException e) {
			logger.error("Error retrieving products by seller ID: " + sellerId, e);
		}
		return products;
	}

	public List<Entity> retrieveByCategoryAndSeller(String category, int sellerId) {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(RETRIEVE_BY_CATEGORY_AND_SELLER_QUERY)) {

			stmt.setString(1, category);
			stmt.setInt(2, sellerId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));

					products.add(product);
				}
				logger.info("Retrieved {} products for category: {} and seller ID: {}", products.size(), category,
						sellerId);
			}
		} catch (SQLException e) {
			logger.error("Error retrieving products by category and seller ID", e);
		}
		return products;
	}

	public List<Entity> searchProductsBySeller(String keyword, int sellerId) {
		List<Entity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(SEARCH_PRODUCTS_BY_SELLER_QUERY)) {

			String searchPattern = "%" + keyword + "%";
			stmt.setString(1, searchPattern);
			stmt.setString(2, searchPattern);
			stmt.setString(3, searchPattern);
			stmt.setString(4, searchPattern);
			stmt.setInt(5, sellerId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));

					products.add(product);
				}
				logger.info("Retrieved {} products for search keyword: {} and seller ID: {}", products.size(), keyword,
						sellerId);
			}
		} catch (SQLException e) {
			logger.error("Error searching products by seller with keyword: " + keyword, e);
		}
		return products;
	}

	public List<ProductEntity> getProductsBelowThreshold(int sellerId) {
		String query = "SELECT * FROM tbl_products WHERE sellerId = ? AND productStock < threshold";
		List<ProductEntity> products = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setInt(1, sellerId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					ProductEntity product = new ProductEntity();
					product.setProductId(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setProductDescription(rs.getString("productDescription"));
					product.setProductPrice(rs.getDouble("productPrice"));
					product.setProductDiscount(rs.getDouble("productDiscount"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
					product.setProductBrand(rs.getString("productBrand"));
					product.setProductCategory(rs.getString("productCategory"));
					product.setProductTags(rs.getString("productTags"));
					product.setProductStatus(rs.getString("productStatus"));
					product.setSellerId(rs.getInt("sellerId"));
					product.setThreshold(rs.getInt("threshold"));
					products.add(product);
				}
				logger.info("Retrieved {} products below threshold for seller ID: {}", products.size(), sellerId);
			}
		} catch (SQLException e) {
			logger.error("Error retrieving products below threshold for seller ID: " + sellerId, e);
		}
		return products;
	}

}
