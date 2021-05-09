/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.javaclass.Email;
import com.user.UserDetail;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chetan
 */
public class UserLoginDAO {
    private Connection conn;
    private static final int max=999999;
    private static final int min=111111;
    
    public UserDetail login(String email, String password) {
        try{
            conn=DBConnect.getConn();
            String query1 = "select * from user where email = ? and password = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            pt1.setString(2, password);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                UserDetail ud = new UserDetail(rs.getInt("id"),rs.getString("name"),rs.getString("email"),rs.getBoolean("activate"));
                if(ud.isActivate()){
                    return ud;
                }
                else{
                    String query2 = "delete from user where email = ?";
                    PreparedStatement pt2 = conn.prepareStatement(query2);
                    pt2.setString(1, email);
                    pt2.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String forgotOTP(String email){
        try{    
            conn=DBConnect.getConn();
            String query1 = "select * from user where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                if(!rs.getBoolean("activate")){
                    String query4 = "delete from user where email = ?";
                    PreparedStatement pt4 = conn.prepareStatement(query4);
                    pt4.setString(1, email);
                    pt4.executeUpdate();
                    return "noEmail";
                }
                System.out.println("fhbkn");
                String query3 = "delete from otp where email = ?";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, email);
                pt3.executeUpdate();
                int otp = UserLoginDAO.getOTP();
                String subject = "One Time Password (OTP) Confirmation - City Hospital";
                String body = "Dear user,\n\nYour verification code is: "+otp+"\nIf you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nCity Hospital";
                Thread th = new Thread(new Email(email,subject,body));
                th.start();
                String query2 = "insert into otp values(?,?)";
                PreparedStatement pt2 = conn.prepareStatement(query2);
                pt2.setString(1, email);
                pt2.setInt(2, otp);
                int j = pt2.executeUpdate();
                if(j==1){
                    System.out.println("ojh");
                    return "done";
                }
            }
            else{
                return "noEmail";
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "no";
    }
    
    public String forgot(String email,String password,int otp){
        try{
            conn=DBConnect.getConn();
            String query1 = "select * from otp where email = ? and otp = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, email);        
            pt1.setInt(2, otp);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                String query3 = "delete from otp where email = ?";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, email);
                pt3.executeUpdate();
                String query ="update user set password = ? where email = ?";
                PreparedStatement pt = conn.prepareStatement(query);
                pt.setString(1, password);
                pt.setString(2, email);
                int i = pt.executeUpdate();
                if(i==1){
                    return "done";
                }
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
 
    private static int getOTP(){
	return (int)(Math.random()*(max-min+1)+min);
    }   
}
