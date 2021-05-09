<%-- 
    Document   : adminPanel
    Created on : 05-May-2021, 9:29:24 AM
    Author     : chetan
--%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.user.AppointmentDetail"%>
<%
    if(session.getAttribute("adminD")==null){
        response.sendRedirect("./adminPanelLogin.jsp");
    }
    AppointmentDAO dao3 = new AppointmentDAO();
    List<AppointmentDetail> list3 = dao3.getAPP();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="adminHead.jsp" %>
    </head>
    <body>
        
        <nav class="navbar navbar-custom-color">
            <a class="navbar-custom-brand" href="./adminPanel.jsp">
              <i class="fa fa-heartbeat" aria-hidden="true"></i> City Hospital Admin Panel
            </a>
            <button onclick="location.href='./adminLogOut.jsp'" class="btn btn-outline-success mr-3"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button>
        </nav>
        
        <div class="container-fluid m-0">
            <div class="row">
                <div class="sidebar">
                    <a href="./adminPanel.jsp" >Home</a>
                    <a href="./adminPanelDoctor.jsp" >Doctors List</a>
                    <a class="active" href="./adminPanelAppointment.jsp" >Patient Appointment</a>
                    <a href="./adminPanelContact.jsp" >Contact</a>
                </div>
                
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <h3 class="text-center m-3">Patient Appointment</h3>
                            </div>
                        </div>
                    </div>
                    
                    <div class="container mt-2 mb-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <td class="font-weight-bold">Appointment ID</td>
                                                <td class="font-weight-bold">Patient Name</td>
                                                <td class="font-weight-bold">Age</td>
                                                <td class="font-weight-bold">Gender</td>
                                                <td class="font-weight-bold">Doctor Name</td>
                                                <td class="font-weight-bold">Date</td>
                                                <td class="font-weight-bold">Done</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(AppointmentDetail ad:list3){

                                            %>
                                                <tr>
                                                    <td><%=ad.getId()%></td>
                                                    <td><%=ad.getPatientName() %></td>
                                                    <td><%=ad.getAge()%></td>
                                                    <td><%=ad.getGender()%></td>
                                                    <td><%=ad.getDoctorName()%></td>
                                                    <td><%=ad.getDate()%></td>     
                                                    <td>
                                                        <a class="btn btn-primary" href="../DoneAppoinmentServlet?id=<%=ad.getId()%>" >Done</a> 
                                                    </td>
                                                </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>                                
                </div>
            </div>
        </div>
        
        <%@include file="../component/script.jsp" %>
    </body>
</html>
