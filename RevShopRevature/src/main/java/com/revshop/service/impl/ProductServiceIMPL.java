package com.revshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.revshop.Entity.Entity;
import com.revshop.Entity.ProductEntity;
import com.revshop.dao.ProductDAO;
import com.revshop.service.ProductService;

public class ProductServiceIMPL implements ProductService {

	private ProductDAO pdao = ProductDAO.getInstance();

	@Override
	public boolean saveProduct(ProductEntity entity) {
		return pdao.insert(entity);
	}

	@Override
	public List<ProductEntity> getAllProducts() {
		List<Entity> entities = pdao.retrieveAll();
		List<ProductEntity> products = new ArrayList<>();

		for (Entity entity : entities) {
			if (entity instanceof ProductEntity) {
				products.add((ProductEntity) entity);
			}
		}

		return products;
	}

	@Override
	public boolean deleteProduct(int id) {
	    // Use the ProductDAO instance to delete the product by ID
	    ProductDAO productDAO = ProductDAO.getInstance();
	    return productDAO.delete(id);
	}


}
