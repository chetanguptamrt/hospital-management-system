<%-- 
    Document   : adminPanel
    Created on : 05-May-2021, 9:29:24 AM
    Author     : chetan
--%>

<%@page import="java.util.List"%>
<%@page import="com.user.DoctorDetail"%>
<%@page import="com.dao.DoctorDAO"%>
<%
    if(session.getAttribute("adminD")==null){
        response.sendRedirect("./adminPanelLogin.jsp");
    }
    DoctorDAO dao = new DoctorDAO();
    List<DoctorDetail> list = dao.getDoctor();
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
                    <a class="active" href="./adminPanelDoctor.jsp" >Doctors List</a>
                    <a href="./adminPanelAppointment.jsp" >Patient Appointment</a>
                    <a href="./adminPanelContact.jsp" >Contact</a>
                </div>
                
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="text-center m-3">Doctors</h2>
                            </div>
                        </div>
                        <div class="row">
                            <h4 class="text-left ml-3">Enter doctors detail - </h4>
                        </div>
                        <form id="doctorForm">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <input class="form-control mt-2" name="name" placeholder="Name" type="text" maxlength="30" required="required"/>
                                    <input class="form-control mt-2" name="specialization" placeholder="Specialization" type="text" maxlength="30" required="required"/>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <input class="form-control mt-2" name="phone" placeholder="Phone" type="text" maxlength="30" required="required"/>
                                    <input class="form-control mt-2" name="email" placeholder="Email" type="email" maxlength="30" required="required"/>
                                </div>
                            </div>
                            <div class="row m-3"> 
                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-outline-success">Submit</button>
                                </div>
                            </div>
                        </form>
                        
                        <div class="row">
                            <div class="col-12">
                                <h4 class="m-3 text-center">Doctors List</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <td class="font-weight-bold">Id</td>
                                                <td class="font-weight-bold">Name</td>
                                                <td class="font-weight-bold">Phone</td>
                                                <td class="font-weight-bold">Email</td>
                                                <td class="font-weight-bold">Specialist</td>
                                                <td class="font-weight-bold">Delete</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for(DoctorDetail dd:list){
                                            %>
                                                <tr>
                                                    <td><%=dd.getId()%></td>
                                                    <td><%=dd.getName()%></td>
                                                    <td><%=dd.getContact()%></td>
                                                    <td>
                                                        <a href="mailto:<%=dd.getEmail()%>" target="_blank">
                                                            <%=dd.getEmail()%>
                                                        </a>
                                                    </td>
                                                    <td><%=dd.getSpecialization()%></td>
                                                    <td><a class="btn btn-danger m-0" href="../DeleteDoctorServlet?id=<%=dd.getId()%>">
                                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
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
        <script>
            $(document).ready(function(){
                $("#doctorForm").on("submit",function(event){
                    event.preventDefault();
                    var f = $(this).serialize();
                    $.ajax({
                        url: "../DoctorServlet",
                        data: f,
                        method: "post",
                        success: function(data){
                            if(data.trim()==="done"){
                                location.reload();
                            }
                            else{
                                alret("something went wrong!");
                            }
                        },
                        error: function(){
                            alret("something went wrong!");
                        }
                    });
                });
            });
        </script>
    </body>
</html>
