package com.revshop.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.revshop.Entity.LoginEntity;
import com.revshop.Entity.ProductEntity;
import com.revshop.service.ProductService;
import com.revshop.service.impl.ProductServiceIMPL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class ProductAddServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(ProductAddServlet.class);

    public ProductAddServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Served at: {}", request.getContextPath());
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.debug("Entering doPost() method in ProductAddServlet");

        HttpSession session = request.getSession();
        LoginEntity user = (LoginEntity) session.getAttribute("user");

        if (user == null) {
            logger.warn("User session is null, redirecting to login page.");
            response.sendRedirect("LoginAndRegistration/user-login.jsp");
            return;
        }

        try {
            int sellerId = user.getUserId();
            String productName = request.getParameter("product_name").trim();
            String productDescription = request.getParameter("product_description").trim();
            String productPriceStr = request.getParameter("product_price").trim();
            String productDiscountStr = request.getParameter("product_discount").trim();
            String productStockStr = request.getParameter("product_stock").trim();
            String productBrand = request.getParameter("product_brand").trim();
            String productCategory = request.getParameter("product_category").trim();
            String productStatus = request.getParameter("product_status").trim();
            String productTags = request.getParameter("product_tags").trim();
            String thresholdStr = request.getParameter("threshold").trim();

            // Validate required fields
            if (productName.isEmpty() || productDescription.isEmpty() || productPriceStr.isEmpty() ||
                    productStockStr.isEmpty() || productBrand.isEmpty() || productCategory.isEmpty() ||
                    productStatus.isEmpty() || thresholdStr.isEmpty()) {
                forwardWithError(request, response, "All fields marked with * are required.");
                return;
            }

            // Validate numeric fields
            double productPrice = 0;
            double productDiscount = 0;
            int productStock = 0;
            int threshold = 0;

            try {
                productPrice = Double.parseDouble(productPriceStr);
                if (productPrice <= 0) {
                    forwardWithError(request, response, "Product price must be greater than 0.");
                    return;
                }

                if (!productDiscountStr.isEmpty()) {
                    productDiscount = Double.parseDouble(productDiscountStr);
                    if (productDiscount < 0 || productDiscount > 100) {
                        forwardWithError(request, response, "Product discount must be between 0 and 100.");
                        return;
                    }
                }

                productStock = Integer.parseInt(productStockStr);
                if (productStock < 0) {
                    forwardWithError(request, response, "Product stock must be 0 or greater.");
                    return;
                }

                threshold = Integer.parseInt(thresholdStr);
                if (threshold < 0) {
                    forwardWithError(request, response, "Threshold must be 0 or greater.");
                    return;
                }
            } catch (NumberFormatException e) {
                forwardWithError(request, response, "Invalid number format in one of the fields.");
                return;
            }

            // Validate image upload
            Part filePart = request.getPart("product_image");
            if (filePart == null || filePart.getSize() == 0) {
                forwardWithError(request, response, "Product image is required.");
                return;
            }

            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!isValidImageType(filePart)) {
                forwardWithError(request, response, "Please upload a valid image file (JPEG, PNG, GIF, WebP).");
                return;
            }

            // Define the upload directory
            String uploadDirectory = "C:\\Users\\Maddy\\git\\RevShop\\RevShopRevature\\src\\main\\webapp\\Static\\img\\home\\";
            Path filePath = Paths.get(uploadDirectory + fileName);
            Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            logger.debug("File uploaded to: {}", filePath);

            // Store the file path in the database
            String imagePath = "Static/img/home/" + fileName;

            // Create a new ProductEntity and set its fields
            ProductEntity product = new ProductEntity();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setProductPrice(productPrice);
            product.setProductDiscount(productDiscount);
            product.setProductStock(productStock);
            product.setProductBrand(productBrand);
            product.setProductCategory(productCategory);
            product.setProductStatus(productStatus);
            product.setProductTags(productTags);
            product.setSellerId(sellerId);
            product.setThreshold(threshold);
            product.setProductImage(imagePath);

            logger.debug("Product entity created: {}", product);

            // Save the product to the database
            ProductService productService = new ProductServiceIMPL();
            boolean isProductSaved = productService.saveProduct(product);

            if (isProductSaved) {
                logger.info("Product successfully saved: {}", productName);
                response.sendRedirect("ProductMaintenanceServlet");
            } else {
                logger.error("Failed to save product: {}", productName);
                response.sendRedirect("Seller/addproduct.jsp");
            }
        } catch (Exception e) {
            logger.error("Error occurred while adding product", e);
            forwardWithError(request, response, "An error occurred while adding the product. Please try again.");
        }

        logger.debug("Exiting doPost() method in ProductAddServlet");
    }

    private boolean isValidImageType(Part part) {
        String contentType = part.getContentType();
        return contentType.equals("image/jpeg") ||
               contentType.equals("image/png") ||
               contentType.equals("image/gif") ||
               contentType.equals("image/webp");
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("Seller/addproduct.jsp").forward(request, response);
    }
}
