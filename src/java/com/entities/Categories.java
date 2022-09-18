/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entities;

/**
 *
 * @author Parth
 */
public class Categories {

    private int cid;
    private String cname;
    private String description;

    public Categories(String cname, String description) {
        this.cname = cname;
        this.description = description;
    }

    public Categories() {
    }

    public Categories(int cid, String cname, String description) {
        this.cid = cid;
        this.cname = cname;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
