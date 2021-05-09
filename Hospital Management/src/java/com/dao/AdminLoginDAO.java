/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.database.DBConnect;
import com.user.AdminDetail;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author chetan
 */
public class AdminLoginDAO {
    Connection conn;
    
    public String login(AdminDetail ad){
        try{
            conn = DBConnect.getConn();
            String query = "select * from admin where username = ? and password = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, ad.getName());
            pt.setString(2, ad.getPassword());
            ResultSet i = pt.executeQuery();
            if(i.next()){
                return "done";
            }
        }
        catch(SQLException e){
            
        }
        return "no";
    }
}
