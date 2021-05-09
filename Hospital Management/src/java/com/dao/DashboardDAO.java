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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class DashboardDAO {
    private Connection conn;
    
    public ArrayList<Integer> getDash(){
        ArrayList<Integer> arr = new ArrayList<Integer>();
        try{
            conn = DBConnect.getConn();
            String query1 = "SELECT COUNT(id) AS nid FROM patient";
            String query2 = "SELECT COUNT(id) AS nid FROM user";
            String query3 = "SELECT COUNT(id) AS nid FROM contact";
            String query4 = "SELECT COUNT(id) AS nid FROM appointment";
            String query5 = "SELECT COUNT(id) AS nid FROM doctor";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            PreparedStatement pt2 = conn.prepareStatement(query2);
            PreparedStatement pt3 = conn.prepareStatement(query3);
            PreparedStatement pt4 = conn.prepareStatement(query4);
            PreparedStatement pt5 = conn.prepareStatement(query5);
            ResultSet rs1 = pt1.executeQuery();
            ResultSet rs2 = pt2.executeQuery();
            ResultSet rs3 = pt3.executeQuery();
            ResultSet rs4 = pt4.executeQuery();
            ResultSet rs5 = pt5.executeQuery();
            rs1.next();
            rs2.next();
            rs3.next();
            rs4.next();
            rs5.next();
            arr.add(rs1.getInt("nid"));
            arr.add(rs2.getInt("nid"));
            arr.add(rs3.getInt("nid"));
            arr.add(rs4.getInt("nid"));
            arr.add(rs5.getInt("nid"));
            
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return arr;
    }
}
