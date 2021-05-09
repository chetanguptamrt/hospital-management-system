<%-- 
    Document   : adminPanel
    Created on : 05-May-2021, 9:29:24 AM
    Author     : chetan
--%>
<%
    if(session.getAttribute("adminD")==null){
        response.sendRedirect("./adminPanelLogin.jsp");
    }
%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.user.ContactDetail"%>
<%
    ContactDAO dao = new ContactDAO();
    List<ContactDetail> list = dao.getContactDetail();
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
                    <a href="./adminPanelAppointment.jsp" >Patient Appointment</a>
                    <a class="active" href="./adminPanelContact.jsp" >Contact</a>
                </div>
                
                <div class="content">

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <h3 class="text-center m-3">Contact Details</h3>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <td class="font-weight-bold">Name</td>
                                                <td class="font-weight-bold">Email</td>
                                                <td class="font-weight-bold">Phone</td>
                                                <td class="font-weight-bold">Subject</td>
                                                <td class="font-weight-bold">Reply</td>
                                                <td class="font-weight-bold">Delete</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <%
                                                for(ContactDetail cd:list){
                                            %>
                                                <tr>
                                                    <td><%=cd.getName()%></td>
                                                    <td><%=cd.getEmail()%></td>
                                                    <td><%=cd.getPhone()%></td>
                                                    <td><%=cd.getSubject()%></td>
                                                    <td>
                                                        <a class="btn btn-success m-0" href="mailto:<%=cd.getEmail()%>?subject=<%=cd.getSubject()%>" target="_blank">
                                                            <i class="fa fa-reply" aria-hidden="true"></i> Reply
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-danger m-0" href="../DeleteContactServlet?id=<%=cd.getId()%>">
                                                            <i class="fa fa-trash-o" aria-hidden="true"></i> Delete
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border:none;" colspan="5">
                                                        <p><%=cd.getMessage()%></p>
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
