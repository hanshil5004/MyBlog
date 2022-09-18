/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Dao;

import com.entities.Post;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

/**
 *
 * @author Parth
 */
public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
//Add Post

    public boolean addPost(Post post) {
        boolean f = false;
        try {
            String q = "insert into post (title,content,pic,cid,uid)values(?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(q);
            smt.setString(1, post.getTitle());
            smt.setString(2, post.getContent());
            smt.setString(3, post.getPic());
            smt.setInt(4, post.getCid());
            smt.setInt(5, post.getUid());
            smt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
//Get All Post

    public ArrayList<Post> getAllPost() {
        ArrayList<Post> list = new ArrayList<>();
        try {
            String q = "select * from post order by id desc";
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery(q);
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String pic = rs.getString("pic");
                Timestamp date = rs.getTimestamp("date");
                int cid = rs.getInt("cid");
                int uid = rs.getInt("uid");
                Post post = new Post(title, content, pic, date, cid, uid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Post> getIdByPost(int cid) {
        ArrayList<Post> list = new ArrayList<>();
        try {
            String q = "select * from post where cid=?";

            PreparedStatement smt = con.prepareStatement(q);
            smt.setInt(1, cid);
            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String pic = rs.getString("pic");
                Timestamp date = rs.getTimestamp("date");
                int pcid = rs.getInt("cid");
                int uid = rs.getInt("uid");
                Post post = new Post(title, content, pic, date, pcid, uid);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getUserPost(int uid) {
        List<Post> list = new ArrayList<>();
        try {
            String q = "select * from post where uid=?";
            PreparedStatement smt = con.prepareStatement(q);
            smt.setInt(1, uid);
            ResultSet rs = smt.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String pic = rs.getString("pic");
                Timestamp date = rs.getTimestamp("date");
                int pcid = rs.getInt("cid");
                int userId = rs.getInt("uid");
                Post post = new Post(title, content, pic, date, pcid, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
