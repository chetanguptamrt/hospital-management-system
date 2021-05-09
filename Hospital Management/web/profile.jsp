<%-- 
    Document   : getAppoinement
    Created on : 04-May-2021, 1:17:52 PM
    Author     : chetan
--%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PatientDAO"%>
<%@page import="com.user.PatientDetail"%>
<%@page import="com.user.UserDetail"%>
<%
    if(session.getAttribute("userD")==null){
        response.sendRedirect("./login.jsp");
    }
    UserDetail ud = (UserDetail)session.getAttribute("userD");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try{
    %>
    <head>
        <style>
            .profile-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title><%=ud.getName()%> | City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Profile</h2>
        </div>
        
        <div class="container mt-4 mb-3">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-5 col-4 text-left">
                    <h3 class="ml-2 font-weight-bold"><%=ud.getName()%></h3>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-7 col-8 text-right">
                    <button onclick="deleteProfile()" class="btn btn-danger mr-3 mb-2">
                        <i class="fa fa-trash" aria-hidden="true"></i> Delete Profile
                    </button>
                    <button onclick="location.href='./logout.jsp'" class="btn btn-primary mr-3 mb-2">
                        <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
                    </button>
                </div>

            </div>
        </div>
        
        <div class="container mt-4 mb-3">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-center">Add Patient</h3>
                </div>
            </div>
            <form id="patientForm">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <input maxlength="30" type="text" name="name" placeholder="Name" class="form-control mt-3" required="required" />
                        <select class="form-control mt-3" name="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <input type="number" name="age" placeholder="Age" class="form-control mt-3" required="required" />
                        <input type="text" maxlength="15" name="contact" placeholder="Phone" class="form-control mt-3" required="required" />
                    </div>
                    <div class="col-12 text-center ">
                        <input class="btn btn-primary mt-3" type="submit"/>
                    </div>
                </div>
            </form>
            <div class="row mt-3 mb-5">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td class="font-weight-bold">Name</td>
                                    <td class="font-weight-bold">Gender</td>
                                    <td class="font-weight-bold">Age</td>
                                    <td class="font-weight-bold">Contact</td>
                                    <td class="font-weight-bold">Delete</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    PatientDAO dao = new PatientDAO();
                                    List<PatientDetail> list = dao.getPatient(ud.getId());
                                    for(PatientDetail dd:list){
                                %>
                                    <tr>
                                        <td><%=dd.getName()%></td>
                                        <td><%=dd.getGender()%></td>
                                        <td><%=dd.getAge()%></td>
                                        <td><%=dd.getContact()%></td>
                                        <td><a class="btn btn-danger m-0" href="./DeletePatientServlet?id=<%=dd.getId()%>&userId=<%=dd.getUserId()%>">
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

        <div class="container mb-5">
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <h4>Change Password</h4>
                    <small id="changeStatus" style="display: none;"></small>
                </div>
            </div>
            <form id="changePass">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mb-2">
                        <input class="form-control" type="password" name="op" id="op" placeholder="Old Password" minlength="8" required="required" /> 
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mb-2">
                        <input class="form-control" type="password" name="np" id="npid" placeholder="New Password" minlength="8" required="required" /> 
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mb-2">
                        <input class="form-control" type="password" name="cp" id="cpid" placeholder="Confirm Password" minlength="8" required="required" /> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <input type="submit" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>
        <script src="./js/profile.js" type="text/javascript"></script>
    </body>
    <%
        }
        catch(Exception e){}
    %>
    
</html>
