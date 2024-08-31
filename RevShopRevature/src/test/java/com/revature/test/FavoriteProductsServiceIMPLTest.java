package com.revature.test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.FavoriteProductsEntity;
import com.revshop.Entity.ProductEntity;
import com.revshop.dao.FavriouteDAO;
import com.revshop.service.ProductService;
import com.revshop.service.impl.FavoriteProductsServiceIMPL;

public class FavoriteProductsServiceIMPLTest {

    @InjectMocks
    private FavoriteProductsServiceIMPL favoriteProductsService;

    @Mock
    private FavriouteDAO favriouteDAO;

    @Mock
    private ProductService productService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddProductToFavorites_Success() {
        // Arrange
        FavoriteProductsEntity favorite = new FavoriteProductsEntity();
        favorite.setProductId(1);
        favorite.setUserId(100);

        ProductEntity product = new ProductEntity();
        product.setProductId(1);
        product.setProductImage("img.jpg");
        product.setProductDiscount(10.0);
        product.setProductName("Test Product");
        product.setProductPrice(100.0);

        when(productService.getProductById(1)).thenReturn(product);
        when(favriouteDAO.insert(favorite)).thenReturn(true);

        // Act
        boolean result = favoriteProductsService.addProductToFavorites(favorite);

        // Assert
        assertTrue(result);
        verify(favriouteDAO, times(1)).insert(favorite);
    }

    @Test
    void testAddProductToFavorites_Failure() {
        // Arrange
        FavoriteProductsEntity favorite = new FavoriteProductsEntity();
        favorite.setProductId(1);
        favorite.setUserId(100);

        when(productService.getProductById(1)).thenThrow(new RuntimeException("Product not found"));

        // Act
        boolean result = favoriteProductsService.addProductToFavorites(favorite);

        // Assert
        assertFalse(result);
        verify(favriouteDAO, never()).insert(favorite);
    }

    @Test
    void testGetFavoritesByUserId() {
        // Arrange
        FavoriteProductsEntity favorite1 = new FavoriteProductsEntity();
        favorite1.setFav_id(1);
        favorite1.setUserId(100);
        favorite1.setProductId(1);

        FavoriteProductsEntity favorite2 = new FavoriteProductsEntity();
        favorite2.setFav_id(2);
        favorite2.setUserId(100);
        favorite2.setProductId(2);

        List<FavoriteProductsEntity> favorites = Arrays.asList(favorite1, favorite2);

        when(favriouteDAO.getFavoritesByUserId(100)).thenReturn(favorites);

        // Act
        List<FavoriteProductsEntity> result = favoriteProductsService.getFavoritesByUserId(100);

        // Assert
        assertEquals(2, result.size());
        verify(favriouteDAO, times(1)).getFavoritesByUserId(100);
    }

    @Test
    void testRemoveProductFromFavorites_Success() {
        // Arrange
        when(favriouteDAO.delete(1)).thenReturn(true);

        // Act
        boolean result = favoriteProductsService.removeProductFromFavorites(1);

        // Assert
        assertTrue(result);
        verify(favriouteDAO, times(1)).delete(1);
    }

    @Test
    void testRemoveProductFromFavorites_Failure() {
        // Arrange
        when(favriouteDAO.delete(1)).thenReturn(false);

        // Act
        boolean result = favoriteProductsService.removeProductFromFavorites(1);

        // Assert
        assertFalse(result);
        verify(favriouteDAO, times(1)).delete(1);
    }
}
