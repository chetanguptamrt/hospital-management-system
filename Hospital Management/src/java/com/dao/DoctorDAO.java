/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.user.DoctorDetail;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chetan
 */
public class DoctorDAO {
    private Connection conn;
    
    public String setDoctor(DoctorDetail dd){
        System.out.println("doctor dao started");
        try{
            conn=DBConnect.getConn();
            String query = "insert into doctor(name,specialization,contact,email) values(?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, dd.getName());
            pt.setString(2, dd.getSpecialization());
            pt.setString(3, dd.getContact());
            pt.setString(4, dd.getEmail());
            int i = pt.executeUpdate();
            if(i==1){
                System.out.println("doctor entry successfully");
                return "done";
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return "no";
    }
    
    public List<DoctorDetail> getDoctor(){
        List<DoctorDetail> list = new ArrayList<DoctorDetail>();
        DoctorDetail dd = null;
        try{
            conn=DBConnect.getConn();
            String query = "select * from doctor";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                dd = new DoctorDetail(rs.getInt("id"),rs.getString("name"),rs.getString("specialization"),rs.getString("contact"),rs.getString("email"));
                list.add(dd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void deleteDoctor(int id){
        try{
            conn=DBConnect.getConn();
            String query = "delete from doctor where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}