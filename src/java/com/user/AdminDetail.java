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
public class AdminDetail {
    private String name;
    private String password;
    private final String active = "yes";

    public AdminDetail(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public AdminDetail(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }
    
    public String getName() {
        return name;
    }

    public String getActive() {
        return active;
    }
    
}
