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
public class RegistrationDetail {
    private String name;
    private String email;
    private String password;
    
    public RegistrationDetail(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public RegistrationDetail(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    
}
