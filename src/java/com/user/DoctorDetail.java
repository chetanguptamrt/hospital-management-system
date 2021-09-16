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
public class DoctorDetail {
    private int id;
    private String name;
    private String specialization;
    private String contact;
    private String email;

    public DoctorDetail(int id, String name, String specialization, String contact, String email) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.contact = contact;
        this.email = email;
    }

    public DoctorDetail(String name, String specialization, String contact, String email) {
        this.name = name;
        this.specialization = specialization;
        this.contact = contact;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getContact() {
        return contact;
    }

    public String getEmail() {
        return email;
    }
    
    
}
