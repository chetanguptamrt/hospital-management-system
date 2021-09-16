/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.database.DBConnect;
import com.javaclass.Email;
import com.user.AppointmentDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chetan
 */
public class AppointmentDAO {
    private Connection conn;
    
    public String bookAppointment(int did, int pid, String date, int id,String toMail){
        try{
            System.out.println(1+" "+did);
            conn = DBConnect.getConn();
            String query = "select * from doctor where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, did);
            ResultSet rs = pt.executeQuery();
            if(rs.next()){
                String query1 = "select * from patient where id = ?";
                PreparedStatement pt1 = conn.prepareStatement(query1);
                pt1.setInt(1, pid);
                ResultSet rs1 = pt1.executeQuery();
                if(rs1.next()){
                    String query2 = "insert into appointment (doctorName,patientName,age,gender,contact,date,patientId) values(?,?,?,?,?,?,?)";
                    PreparedStatement pt2 = conn.prepareStatement(query2);
                    pt2.setString(1, rs.getString("name"));
                    pt2.setString(2, rs1.getString("name"));
                    pt2.setInt(3, rs1.getInt("age"));
                    pt2.setString(4, rs1.getString("gender"));
                    pt2.setString(5, rs1.getString("contact"));
                    pt2.setString(6, date);
                    pt2.setInt(7, id);
                    int i = pt2.executeUpdate();
                    if(i==1){
                        String subject = "Appointment Booked";
                        String body = "Hii "+rs1.getString("name")+",\n\nYour appoinment has been booked."
                                + "If you are having any issue, please don't hesitate to contact us."
                                + "\n\nAppointmentdetail - "+"\nDoctor Name - "+rs.getString("name")
                                +"\nDate - "+date+"\n\nThanks!\nCity Hospital";
                        Thread th = new Thread( new Email(toMail,subject,body));
                        th.start();
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
    
    public List<AppointmentDetail> getAPP(int id){
        List<AppointmentDetail> list = new ArrayList<AppointmentDetail>();
        AppointmentDetail dd = null;
        try{
            conn=DBConnect.getConn();
            String query = "select * from appointment where patientId = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                dd = new AppointmentDetail(rs.getInt("id"),rs.getString("doctorName"),rs.getString("patientName"),rs.getInt("age"),rs.getString("gender"),rs.getString("contact"),rs.getString("date"),rs.getInt("patientID"));
                list.add(dd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<AppointmentDetail> getAPP(){
        List<AppointmentDetail> list = new ArrayList<AppointmentDetail>();
        AppointmentDetail dd = null;
        try{
            conn=DBConnect.getConn();
            String query = "select * from appointment";
            PreparedStatement pt = conn.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            while(rs.next()){
                dd = new AppointmentDetail(rs.getInt("id"),rs.getString("doctorName"),rs.getString("patientName"),rs.getInt("age"),rs.getString("gender"),rs.getString("contact"),rs.getString("date"),rs.getInt("patientID"));
                list.add(dd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void deleteAppoint(int id){
        try{
            conn=DBConnect.getConn();
            String query = "delete from appointment where id = ?";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setInt(1, id);
            pt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
