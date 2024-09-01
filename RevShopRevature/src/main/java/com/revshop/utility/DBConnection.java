package com.revshop.utility;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class DBConnection {

    private static HikariDataSource dataSource;

    static {
        Properties props = new Properties();
        try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("application.properties")) {
            if (input == null) {
                throw new IOException("Sorry, unable to find application.properties");
            }
            props.load(input);
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        HikariConfig config = new HikariConfig();
        config.setDriverClassName(props.getProperty("db.driver-class-name"));
        config.setJdbcUrl(props.getProperty("db.url"));
        config.setUsername(props.getProperty("db.username"));
        config.setPassword(props.getProperty("db.password"));
        config.setMaximumPoolSize(Integer.parseInt(props.getProperty("db.maximum-pool-size")));

        dataSource = new HikariDataSource(config);
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
