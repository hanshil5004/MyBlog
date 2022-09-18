/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entities;

import java.sql.Timestamp;

/**
 *
 * @author Parth
 */
public class Post {

    private int id;
    private String title;
    private String content;
    private String pic;
    private Timestamp date;
    private int cid;
    private int uid;

    public Post(String title, String content, String pic, Timestamp date, int cid, int uid) {
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.date = date;
        this.cid = cid;
        this.uid = uid;
    }

    public Post(int id, String title, String content, String pic, Timestamp date, int cid, int uid) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.pic = pic;
        this.date = date;
        this.cid = cid;
        this.uid = uid;
    }

    public Post() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

}
