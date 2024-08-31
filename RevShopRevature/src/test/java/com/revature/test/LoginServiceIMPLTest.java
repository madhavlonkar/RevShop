package com.revature.test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.Entity.LoginEntity;
import com.revshop.dao.LoginDAO;
import com.revshop.service.impl.LoginServiceIMPL;
import com.revshop.utility.BCryptPasswordUtil;

public class LoginServiceIMPLTest {

    @InjectMocks
    private LoginServiceIMPL loginService;

    @Mock
    private LoginDAO loginDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        loginService = LoginServiceIMPL.getInstance();
    }

    @Test
    void testSaveLogin_Success() {
        LoginEntity loginEntity = new LoginEntity();
        loginEntity.setEmail("test@example.com");

        when(loginDAO.insert(loginEntity)).thenReturn(true);

        boolean result = loginService.saveLogin(loginEntity);

        assertTrue(result);
        verify(loginDAO, times(1)).insert(loginEntity);
    }

    @Test
    void testEmailExists() {
        when(loginDAO.findByEmail("test@example.com")).thenReturn(new LoginEntity());

        boolean exists = loginService.emailExists("test@example.com");

        assertTrue(exists);
    }

    @Test
    void testValidate_Success() {
        String email = "test@example.com";
        String password = "password";
        String hashedPassword = BCryptPasswordUtil.hashPassword(password);

        LoginEntity loginEntity = new LoginEntity();
        loginEntity.setPassword(hashedPassword);

        when(loginDAO.findByEmail(email)).thenReturn(loginEntity);

        boolean result = loginService.validate(email, password);

        assertTrue(result);
    }

    @Test
    void testValidate_Failure_InvalidPassword() {
        String email = "test@example.com";
        String password = "wrongpassword";
        String hashedPassword = BCryptPasswordUtil.hashPassword("password");

        LoginEntity loginEntity = new LoginEntity();
        loginEntity.setPassword(hashedPassword);

        when(loginDAO.findByEmail(email)).thenReturn(loginEntity);

        boolean result = loginService.validate(email, password);

        assertFalse(result);
    }

    @Test
    void testUpdateFirstLoginFlag() {
        String email = "test@example.com";
        LoginEntity loginEntity = new LoginEntity();
        loginEntity.setEmail(email);
        loginEntity.setFirstLogin(true);

        when(loginDAO.findByEmail(email)).thenReturn(loginEntity);
        when(loginDAO.update(loginEntity)).thenReturn(true);

        boolean result = loginService.updateFirstLoginFlag(email);

        assertTrue(result);
        verify(loginDAO, times(1)).findByEmail(email);
        verify(loginDAO, times(1)).update(loginEntity);
    }
}
