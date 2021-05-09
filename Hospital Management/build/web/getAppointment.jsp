<%-- 
    Document   : getAppoinement
    Created on : 04-May-2021, 1:17:52 PM
    Author     : chetan
--%>
<%@page import="com.user.AppointmentDetail"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.user.UserDetail"%>
<%@page import="com.user.PatientDetail"%>
<%@page import="com.dao.PatientDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.user.DoctorDetail"%>
<%@page import="com.dao.DoctorDAO"%>
<%
    try{
        if(session.getAttribute("userD")==null){
            response.sendRedirect("./login.jsp");
        }
        DoctorDAO dao = new DoctorDAO();
        List<DoctorDetail> list = dao.getDoctor();

        UserDetail ud = (UserDetail)session.getAttribute("userD");
        PatientDAO dao2 = new PatientDAO();
        List<PatientDetail> list2 = dao2.getPatient(ud.getId());
        AppointmentDAO dao3 = new AppointmentDAO();
        List<AppointmentDetail> list3 = dao3.getAPP(ud.getId());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <style>
            .appointment-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>Appointment | City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Appointment</h2>
        </div>
        
        <div class="container mt-4 mb-5">
            <div class="row">
                <div class="col-12 text-center">
                    <h3>Book Your Appointment</h3>
                    <small id="getStatus" style="display: none;"></small>
                </div>
            </div>
            
            <form id="getApp">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Doctor name</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <select onchange="getSpec()" class="form-control" name="did" id="dname">
                            <option value="0">None</option>
                            <%
                                for(DoctorDetail dd:list){
                            %>
                            <option value="<%=dd.getId()%>"><%=dd.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Doctor Specialization</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <input placeholder="None" id="specs" class="form-control" disabled />
                    </div>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Patient name</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <select onchange="getContact()" id="pname" name="pid" class="form-control">
                            <option value="0">None</option>
                            <%
                                for(PatientDetail pd:list2){
                            %>
                                    <option value="<%=pd.getId()%>"><%=pd.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Patient Age</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <input placeholder="None" id="age" class="form-control" disabled />
                    </div>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Patient Contact</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <input placeholder="None" id="contact" class="form-control" disabled />
                    </div>

                    <%
                        Date date = new Date();  
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
                        String strDate= formatter.format(date);  
                    %>

                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <h5>Date</h5>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mt-2">
                        <input type="date" id="date" name="date" min="<%=strDate%>" class="form-control" />
                    </div>
                
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-3 mb-3">
                        <button class="btn btn-primary" type="submit">Book Appointment</button>
                    </div>
                </div>
            </form>
        </div>

        
        <div class="container mt-2 mb-4">
            <div class="col-12">
                <h3 class="m-3 text-center">My Appointments</h3>
            </div>
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

        <script>
            var doctorSpecs = {"none":"None"};
            <%
                for(DoctorDetail dd:list){
            %>
                doctorSpecs["<%=dd.getId()%>"] = "<%=dd.getSpecialization()%>";
            <%
                }
            %>
                
            var patientSpecs = {"none":{age:"None",contact:"None"}};
            <%
                for(PatientDetail pd:list2){
            %>
                patientSpecs[<%=pd.getId()%>] = {age:"<%=pd.getAge()%>",contact:"<%=pd.getContact()%>"};
            <%
                }
            %>
            
            function getSpec(){
                $("#specs").val(doctorSpecs[$("#dname").val()]);
            }
            
            function getContact(){
                $("#age").val(patientSpecs[$("#pname").val()].age);
                $("#contact").val(patientSpecs[$("#pname").val()].contact);
            }
            
            $(document).ready(function(){
                if("<%=request.getParameter("idA") %>"!=="null"){
                    $("#dname").val("<%=request.getParameter("idA") %>");
                    $("#specs").val(doctorSpecs["<%=request.getParameter("idA") %>"]);
                }
                $("#getApp").on("submit",function(event){
                    event.preventDefault();
                    if($("pname").val()!=="0" && $("dname").val()!=="0" && $("#date").val()!==""){
                        var f = $(this).serialize();
                        $.ajax({
                            url: "./GetAppointmentServlet",
                            data: f,
                            method: "post",
                            success: function(data){
                                if(data.trim()==="done"){
                                    location.href = "./getAppointment.jsp";
                                }
                                else{
                                    $("#getStatus").show();
                                    $("#getStatus").addClass("text-success");                            
                                    $("#getStatus").addClass("text-danger");
                                    $("#getStatus").html("Something went wrong!");
                                }
                            },
                            error: function(){
                                $("#getStatus").show();
                                $("#getStatus").addClass("text-success");                            
                                $("#getStatus").addClass("text-danger");
                                $("#getStatus").html("Something went wrong!");
                            }
                        });
                    } else{
                            $("#getStatus").show();
                            $("#getStatus").addClass("text-success");                            
                            $("#getStatus").addClass("text-danger");
                            $("#getStatus").html("Please enter full detail");
                    }
                });
            });
        </script>
    </body>

</html>
<%
    }
    catch(Exception e){}
%>