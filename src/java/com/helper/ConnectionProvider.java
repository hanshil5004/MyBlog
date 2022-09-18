/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Parth
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            if (con == null) {

                // Driver Class Load
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create Connection
                String url = "jdbc:mysql://localhost:3306/blogs";

                String user = "root";

                String password = "root";

                con = DriverManager.getConnection(url, user, password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
