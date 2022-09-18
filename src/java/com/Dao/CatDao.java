/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.entities.Categories;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Parth
 */
public class CatDao {

    private Connection con;

    public CatDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getCategories() {
        ArrayList<Categories> list = new ArrayList<>();

        try {
            String q = "select * from category";
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery(q);

            while (rs.next()) {

                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Categories c = new Categories(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
        return list;
    }
}
