/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Parth
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUsers(User user) {
        boolean f = false;
        try {
            String q = "insert into users (name,gender,phone,email,password,profile,about)values(?,?,?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(q);
            smt.setString(1, user.getName());
            smt.setString(2, user.getGender());
            smt.setString(3, user.getPhone());
            smt.setString(4, user.getEmail());
            smt.setString(5, user.getPassword());
            smt.setString(6, user.getProfile());
            smt.setString(7, user.getAbout());
            smt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUser(String email, String password) {
        User user = null;
        try {

            String q = "select * from users where email=? and password=?";
            PreparedStatement smt = con.prepareStatement(q);
            smt.setString(1, email);
            smt.setString(2, password);
            ResultSet rs = smt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setGender(rs.getString("gender"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setProfile(rs.getString("profile"));
                user.setRdate(rs.getTimestamp("rdate"));
                user.setAbout(rs.getString("about"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String q = "update users set name=?,phone=?,email=?,password=?,profile=?,about=? where id=? ";
            PreparedStatement smt = con.prepareStatement(q);
            smt.setString(1, user.getName());
//            smt.setString(2, user.getGender());
            smt.setString(2, user.getPhone());
            smt.setString(3, user.getEmail());
            smt.setString(4, user.getPassword());
            smt.setString(5, user.getProfile());
            smt.setString(6, user.getAbout());
            smt.setInt(7, user.getId());
            smt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
