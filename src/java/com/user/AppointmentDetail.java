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
public class AppointmentDetail {
    private int id;
    private String doctorName;
    private String patientName;
    private int age;
    private String gender;
    private String contact;
    private String date;
    private int pId;

    public AppointmentDetail(int id, String doctorName, String patientName, int age, String gender, String contact, String date, int pId) {
        this.id = id;
        this.doctorName = doctorName;
        this.patientName = patientName;
        this.age = age;
        this.gender = gender;
        this.contact = contact;
        this.date = date;
        this.pId = pId;
    }


    public int getId() {
        return id;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getPatientName() {
        return patientName;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getContact() {
        return contact;
    }

    public String getDate() {
        return date;
    }

    public int getpId() {
        return pId;
    }
    
}
