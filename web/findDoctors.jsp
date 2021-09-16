<%-- 
    Document   : findDoctors
    Created on : 07-May-2021, 5:26:28 PM
    Author     : chetan
--%>
<%@page import="java.util.List"%>
<%@page import="com.user.DoctorDetail"%>
<%@page import="com.dao.DoctorDAO"%>
<%
    DoctorDAO dao = new DoctorDAO();
    List<DoctorDetail> list = dao.getDoctor();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .doctor-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>Doctors | City Hospital</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Doctors</h2>
        </div>
        
        <div class="container mt-4 mb-4">
            <div class="col-12">
                <h3 class="m-3 text-center">Doctors List</h3>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td class="font-weight-bold">Name</td>
                                    <td class="font-weight-bold">Phone</td>
                                    <td class="font-weight-bold">Email</td>
                                    <td class="font-weight-bold">Specialist</td>
                                    <td class="font-weight-bold">Appointment</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for(DoctorDetail dd:list){
                                %>
                                    <tr>
                                        <td><%=dd.getName()%></td>
                                        <td><%=dd.getContact()%></td>
                                        <td>
                                            <a href="mailto:<%=dd.getEmail()%>" target="_blank">
                                                <%=dd.getEmail()%>
                                            </a>
                                        </td>
                                        <td><%=dd.getSpecialization()%></td>
                                        <td><a class="btn btn-primary m-0" href="getAppointment.jsp?idA=<%=dd.getId()%>">
                                            <i class="fa fa-user-md" aria-hidden="true"></i> Get Appointment</a>
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
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>

    </body>
</html>
