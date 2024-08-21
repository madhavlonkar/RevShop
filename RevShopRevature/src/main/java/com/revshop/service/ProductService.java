package com.revshop.service;

import java.util.List;

import com.revshop.Entity.ProductEntity;

public interface ProductService {

	public boolean saveProduct(ProductEntity entity);

	List<ProductEntity> getAllProducts();

	public boolean deleteProduct(int id);

	ProductEntity getProductById(int id);

}
