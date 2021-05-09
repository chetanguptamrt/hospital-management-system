/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.user.PatientDetail;
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
public class PatientDAO {
    private Connection conn;
    
    public String addPatient(PatientDetail pd){
        try{
            conn=DBConnect.getConn();
            String query = "insert into patient(name,gender,age,contact,userId) values(?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, pd.getName());
            pt.setString(2, pd.getGender());
            pt.setInt(3, pd.getAge());
            pt.setString(4, pd.getContact());
            pt.setInt(5, pd.getUserId());
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    public List<PatientDetail> getPatient(int userID){
        List<PatientDetail> list = new ArrayList<PatientDetail>();
        PatientDetail pd = null;
        try{
            conn=DBConnect.getConn();
            String query = "select * from patient where userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, userID);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                pd = new PatientDetail(rs.getInt("id"),rs.getString("name"),rs.getString("gender"),rs.getInt("age"),rs.getString("contact"),rs.getInt("userId")); 
                list.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public String removePatient(int id, int userId){
        try{
            conn=DBConnect.getConn();
            String query = "delete from patient where id = ? and userId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.setInt(2, userId);
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
}
