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
public class User {
    //	Using User Variable

    private int id;
    private String name;
    private String gender;
    private String phone;
    private String email;
    private String password;
    private String profile;
    private Timestamp rdate;
    private String about;

//	Constructors
    public User(int id, String name, String gender, String phone, String email, String password, String profile,
            Timestamp rdate, String about) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.profile = profile;
        this.rdate = rdate;
        this.about = about;
    }

//without id Constructor
    public User(String name, String gender, String phone, String email, String password, String profile, Timestamp rdate, String about) {
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.profile = profile;
        this.rdate = rdate;
        this.about = about;
    }

//default Constructor
    public User() {
    }
//Getters And Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

}
