<%-- 
    Document   : adminPanel
    Created on : 05-May-2021, 9:29:24 AM
    Author     : chetan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.DashboardDAO"%>
<%
    if(session.getAttribute("adminD")==null){
        response.sendRedirect("./adminPanelLogin.jsp");
    }
    DashboardDAO dao = new DashboardDAO();
    ArrayList<Integer> list = dao.getDash();
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
                    <a class="active" href="./adminPanel.jsp" >Home</a>
                    <a href="./adminPanelDoctor.jsp" >Doctors List</a>
                    <a href="./adminPanelAppointment.jsp" >Patient Appointment</a>
                    <a href="./adminPanelContact.jsp" >Contact</a>
                </div>
                
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="text-center mt-3 mb-3">Dashboard</h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 ">
                                <div class="card bg-light m-3">
                                    <div class="card-header">User</div>
                                    <div class="card-body">
                                        <p class="card-text">Total User - <%=list.get(1) %></p>
                                        <p class="card-text">Total Patient - <%=list.get(0) %></p>
                                        <p class="card-text">Total Contact user- <%=list.get(2) %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 ">
                                <div class="card bg-light m-3">
                                    <div class="card-header">Hospital</div>
                                    <div class="card-body">
                                        <p class="card-text">Total Doctor - <%=list.get(4) %></p>
                                        <p class="card-text">Total Appointment - <%=list.get(3) %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <%@include file="../component/script.jsp" %>
        <script>
        </script>
    </body>
</html>
