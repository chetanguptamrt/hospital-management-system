/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.user.ContactDetail;
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
public class ContactDAO {
    private Connection conn;
    
    public String insertContactDetail(ContactDetail cd){
        try {
            conn = DBConnect.getConn();
            String query = "insert into contact(name,email,phone,subject,message) values(?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1, cd.getName());
            pt.setString(2, cd.getEmail());
            pt.setString(3, cd.getPhone());
            pt.setString(4, cd.getSubject());
            pt.setString(5, cd.getMessage());
            int i = pt.executeUpdate();
            if(i==1){
                return "done";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "no";
    }
    
    public List<ContactDetail> getContactDetail(){
        List<ContactDetail> list= new ArrayList<ContactDetail>();
        ContactDetail cd = null;
        try{
            conn = DBConnect.getConn();
            String query = "select * from contact limit 30";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                cd = new ContactDetail(rs.getInt("id"),rs.getString("name"),rs.getString("email"),rs.getString("phone"),rs.getString("subject"),rs.getString("message"));
                list.add(cd);
            }
        }
        catch(SQLException e){
        }
        
        return list;
    }
    
    public void deleteContactDeatil(int id){
        try{
            conn = DBConnect.getConn();
            String query = "delete from contact where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.executeUpdate();
        }
        catch(SQLException e){
        }
    }
    
}
