/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user;

/**
 *
 * @author chetan
 */
public class PatientDetail {
    private int id;
    private String name;
    private String gender;
    private int age;
    private String contact;
    private int userId;

    public PatientDetail(int id, String name, String gender, int age, String contact, int userId) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.contact = contact;
        this.userId = userId;
    }

    public PatientDetail(String name, String gender, int age, String contact, int userId) {
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.contact = contact;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getContact() {
        return contact;
    }

    public int getUserId() {
        return userId;
    }
    
}
