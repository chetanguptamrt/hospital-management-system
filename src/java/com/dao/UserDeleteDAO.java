/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class UserDeleteDAO {
    private Connection conn;
    
    public void deleteUser(int id){
        try{
            conn= DBConnect.getConn();
            String query = "delete from user where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDeleteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String changePassword (int id,String oldPass,String newPass){
        try{
            conn= DBConnect.getConn();
            String query1 = "select * from user where id = ? and password = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setInt(1, id);
            pt1.setString(2, oldPass);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                String query = "update user set password = ? where id = ?";
                PreparedStatement pt = conn.prepareStatement(query);
                pt.setString(1, newPass);
                pt.setInt(2, id);
                int i = pt.executeUpdate();
                if(i==1){
                    return "done";
                }
            }
            else{
                return "notMatched";
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDeleteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
}
