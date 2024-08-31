package com.revature.test;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.ProductEntity;
import com.revshop.dao.ProductDAO;
import com.revshop.service.impl.ProductServiceIMPL;

public class ProductServiceIMPLTest {

    @InjectMocks
    private ProductServiceIMPL productService;

    @Mock
    private ProductDAO productDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testSaveProduct_Success() {
        ProductEntity product = new ProductEntity();
        product.setProductName("Product 1");

        when(productDAO.insert(product)).thenReturn(true);

        boolean result = productService.saveProduct(product);

        assertTrue(result);
        verify(productDAO, times(1)).insert(product);
    }

    @Test
    void testSaveProduct_Failure() {
        ProductEntity product = new ProductEntity();
        product.setProductName("Product 1");

        when(productDAO.insert(product)).thenReturn(false);

        boolean result = productService.saveProduct(product);

        assertFalse(result);
        verify(productDAO, times(1)).insert(product);
    }

    @Test
    void testGetAllProducts_Success() {
        ProductEntity product1 = new ProductEntity();
        product1.setProductName("Product 1");

        ProductEntity product2 = new ProductEntity();
        product2.setProductName("Product 2");

        when(productDAO.retrieveAll()).thenReturn(Arrays.asList(product1, product2));

        List<ProductEntity> products = productService.getAllProducts();

        assertNotNull(products);
        assertEquals(2, products.size());
        verify(productDAO, times(1)).retrieveAll();
    }

    @Test
    void testDeleteProduct_Success() {
        int productId = 1;

        when(productDAO.delete(productId)).thenReturn(true);

        boolean result = productService.deleteProduct(productId);

        assertTrue(result);
        verify(productDAO, times(1)).delete(productId);
    }

    @Test
    void testDeleteProduct_Failure() {
        int productId = 1;

        when(productDAO.delete(productId)).thenReturn(false);

        boolean result = productService.deleteProduct(productId);

        assertFalse(result);
        verify(productDAO, times(1)).delete(productId);
    }

    @Test
    void testGetProductById_Success() {
        int productId = 1;
        ProductEntity product = new ProductEntity();
        product.setProductId(productId);

        when(productDAO.retrieveById(productId)).thenReturn(product);

        ProductEntity result = productService.getProductById(productId);

        assertNotNull(result);
        assertEquals(productId, result.getProductId());
        verify(productDAO, times(1)).retrieveById(productId);
    }

    @Test
    void testUpdateProduct_Success() {
        ProductEntity product = new ProductEntity();
        product.setProductName("Product 1");

        when(productDAO.update(product)).thenReturn(true);

        boolean result = productService.updateProduct(product);

        assertTrue(result);
        verify(productDAO, times(1)).update(product);
    }

    @Test
    void testGetProductsByCategory_Success() {
        String category = "Electronics";
        ProductEntity product1 = new ProductEntity();
        product1.setProductCategory(category);

        ProductEntity product2 = new ProductEntity();
        product2.setProductCategory(category);

        when(productDAO.retrieveByCategory(category)).thenReturn(Arrays.asList(product1, product2));

        List<ProductEntity> products = productService.getProductsByCategory(category);

        assertNotNull(products);
        assertEquals(2, products.size());
        verify(productDAO, times(1)).retrieveByCategory(category);
    }

    @Test
    void testSearchProducts_Success() {
        String keyword = "Phone";
        ProductEntity product1 = new ProductEntity();
        product1.setProductName("Phone 1");

        ProductEntity product2 = new ProductEntity();
        product2.setProductName("Phone 2");

        when(productDAO.searchProducts(keyword)).thenReturn(Arrays.asList(product1, product2));

        List<ProductEntity> products = productService.searchProducts(keyword);

        assertNotNull(products);
        assertEquals(2, products.size());
        verify(productDAO, times(1)).searchProducts(keyword);
    }
}
