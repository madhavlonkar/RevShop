package com.revshop.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ProductUpdateServlet.class);

    public ProductUpdateServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductServiceIMPL();

        try {
            int productId = Integer.parseInt(request.getParameter("product_id"));
            String productName = request.getParameter("product_name");
            String productDescription = request.getParameter("product_description");
            double productPrice = Double.parseDouble(request.getParameter("product_price"));
            double productDiscount = Double.parseDouble(request.getParameter("product_discount"));
            int productStock = Integer.parseInt(request.getParameter("product_stock"));
            String productBrand = request.getParameter("product_brand");
            String productCategory = request.getParameter("product_category");
            String productTags = request.getParameter("product_tags");
            String productStatus = request.getParameter("product_status");

            logger.debug("Received product update request - ID: {}, Name: {}", productId, productName);

            // Create a ProductEntity object and set its properties
            ProductEntity product = new ProductEntity();
            product.setProductId(productId);
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setProductPrice(productPrice);
            product.setProductDiscount(productDiscount);
            product.setProductStock(productStock);
            product.setProductBrand(productBrand);
            product.setProductCategory(productCategory);
            product.setProductTags(productTags);
            product.setProductStatus(productStatus);

            // Handle file upload for product image
            Part filePart = request.getPart("product_image");
            String uploadDirectory = "C:\\Users\\Maddy\\git\\RevShop\\RevShopRevature\\src\\main\\webapp\\Static\\img\\home\\";
            String imagePath;

            if (filePart != null && filePart.getSize() > 0) {
                // Get the file name from the Part object
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Create a path for the file
                Path filePath = Paths.get(uploadDirectory + fileName);

                // Save the file to the specified directory
                Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                logger.debug("Product image uploaded to: {}", filePath);

                // Store the file path in the database
                imagePath = "Static/img/home/" + fileName;
                product.setProductImage(imagePath); // Update the image path if a new image is provided
            } else {
                // Keep the existing image path if no new image is provided
                ProductEntity existingProduct = productService.getProductById(productId);
                product.setProductImage(existingProduct.getProductImage());
                logger.debug("No new image uploaded, retaining existing image path: {}", existingProduct.getProductImage());
            }

            // Update the product in the database
            boolean isUpdated = productService.updateProduct(product);

            if (isUpdated) {
                logger.info("Product updated successfully - ID: {}", productId);
                response.sendRedirect("ProductMaintenanceServlet");
            } else {
                logger.error("Failed to update product - ID: {}", productId);
                response.sendRedirect("product-edit.jsp?updateSuccess=false");
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid product ID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (Exception e) {
            logger.error("Error occurred while updating product", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}
