package com.revature.test;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.UserEntity;
import com.revshop.dao.UserDAO;
import com.revshop.service.impl.UserServiceIMPL;

public class UserServiceIMPLTest {

    @InjectMocks
    private UserServiceIMPL userService;

    @Mock
    private UserDAO userDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testUpdateUserDetails_Success() {
        UserEntity user = new UserEntity();
        user.setUserId(1);
        user.setFirstName("John");

        when(userDAO.update(user)).thenReturn(true);

        boolean result = userService.updateUserDetails(user);

        assertTrue(result);
        verify(userDAO, times(1)).update(user);
    }

    @Test
    void testUpdateUserDetails_Failure() {
        UserEntity user = new UserEntity();
        user.setUserId(1);
        user.setFirstName("John");

        when(userDAO.update(user)).thenReturn(false);

        boolean result = userService.updateUserDetails(user);

        assertFalse(result);
        verify(userDAO, times(1)).update(user);
    }

    @Test
    void testGetUserById_Success() {
        int userId = 1;
        UserEntity user = new UserEntity();
        user.setUserId(userId);
        user.setFirstName("John");

        when(userDAO.retrieveById(userId)).thenReturn(user);

        UserEntity result = userService.getUserById(userId);

        assertNotNull(result);
        assertEquals(userId, result.getUserId());
        verify(userDAO, times(1)).retrieveById(userId);
    }

    @Test
    void testGetUserById_NotFound() {
        int userId = 1;

        when(userDAO.retrieveById(userId)).thenReturn(null);

        UserEntity result = userService.getUserById(userId);

        assertNull(result);
        verify(userDAO, times(1)).retrieveById(userId);
    }
}
