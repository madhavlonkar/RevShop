package com.revshop.Entity;

import java.util.Arrays;
import java.util.Base64;

public class ProductEntity implements Entity {

	private int productId;
	private String productName;
	private String productDescription;
	private double productPrice;
	private double productDiscount;
	private int productStock;
	private byte[] productImage;
	private String productBrand;
	private String productCategory;
	private String productTags;
	private String productStatus;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public double getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(double productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductTags() {
		return productTags;
	}

	public void setProductTags(String productTags) {
		this.productTags = productTags;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public byte[] getProductImage() {
		return productImage;
	}

	public void setProductImage(byte[] productImage) {
		this.productImage = productImage;
	}

	public ProductEntity(int productId, String productName, String productDescription, double productPrice,
			double productDiscount, int productStock, byte[] productImage, String productBrand, String productCategory,
			String productTags, String productStatus) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productStock = productStock;
		this.productImage = productImage;
		this.productBrand = productBrand;
		this.productCategory = productCategory;
		this.productTags = productTags;
		this.productStatus = productStatus;
	}

	public ProductEntity() {
		super();
	}
	
	public String getProductImageAsBase64() {
        if (this.productImage != null && this.productImage.length > 0) {
            return Base64.getEncoder().encodeToString(this.productImage);
        }
        return null;
    }
    
    public String getProductImageUrl() {
        String base64Image = getProductImageAsBase64();
        if (base64Image != null) {
            return "data:image/jpeg;base64," + base64Image;
        }
        return "path/to/default/image.jpg"; // Fallback in case no image is available
    }

	@Override
	public String toString() {
		return "ProductEntity [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount
				+ ", productStock=" + productStock + ", productImage=" + Arrays.toString(productImage)
				+ ", productBrand=" + productBrand + ", productCategory=" + productCategory + ", productTags="
				+ productTags + ", productStatus=" + productStatus + "]";
	}

}
