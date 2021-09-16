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
public class UserDetail {
    private int id;
    private String name;
    private String email;
    private boolean activate;

    public UserDetail(int id, String name, String email, boolean activate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.activate = activate;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public boolean isActivate() {
        return activate;
    }
}
