/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.javaclass.Email;
import com.user.RegistrationDetail;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
/**
 *
 * @author chetan
 */
public class UserRegistrationDAO {
    private Connection conn;
    private static final int max=999999;
    private static final int min=111111;
    
    public String sendEmail(RegistrationDetail rd){
        try{
            conn=DBConnect.getConn();
            String query1 = "select * from user where email = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, rd.getEmail());
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                if(rs.getBoolean("activate")){
                    return "alreadyEmail";
                }
                else{
                    String query4 = "delete from user where email = ?";
                    PreparedStatement pt4 = conn.prepareStatement(query4);
                    pt4.setString(1, rd.getEmail());
                    pt4.executeUpdate();
                }
            }
            else{
                String query ="insert into user(name,email,password,activate) values(?,?,?,?)";
                PreparedStatement pt = conn.prepareStatement(query);
                pt.setString(1, rd.getName());
                pt.setString(2, rd.getEmail());
                pt.setString(3, rd.getPassword());
                pt.setBoolean(4, false);
                int i = pt.executeUpdate();
                if(i==1){
                    String query3 = "delete from otp where email = ?";
                    PreparedStatement pt3 = conn.prepareStatement(query3);
                    pt3.setString(1, rd.getEmail());
                    pt3.executeUpdate();
                    int otp = UserRegistrationDAO.getOTP();
                    String subject = "One Time Password (OTP) Confirmation - City Hospital";
                    String body = "Dear "+rd.getName()+",\n\nYour verification code is: "+otp+"\nIf you are having any issue with your account, please don't hesitate to contact us.\n\nThanks!\nCity Hospital";
                    Thread th = new Thread(new Email(rd.getEmail(),subject,body));
                    th.start();
                    String query2 = "insert into otp values(?,?)";
                    PreparedStatement pt2 = conn.prepareStatement(query2);
                    pt2.setString(1, rd.getEmail());
                    pt2.setInt(2, otp);
                    int j = pt2.executeUpdate();
                    if(j==1){
                        return "done";
                    }
                }    
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return "no";
    }
    
    public String checkOTP(RegistrationDetail rd,int otp){
        try{
            conn=DBConnect.getConn();
            String query1 = "select * from otp where email = ? and otp = ?";
            PreparedStatement pt1 = conn.prepareStatement(query1);
            pt1.setString(1, rd.getEmail());        
            pt1.setInt(2, otp);
            ResultSet rs = pt1.executeQuery();
            if(rs.next()){
                String query3 = "delete from otp where email = ?";
                PreparedStatement pt3 = conn.prepareStatement(query3);
                pt3.setString(1, rd.getEmail());
                pt3.executeUpdate();
                String query ="update user set activate = true where email = ?";
                PreparedStatement pt = conn.prepareStatement(query);
                pt.setString(1, rd.getEmail());
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
