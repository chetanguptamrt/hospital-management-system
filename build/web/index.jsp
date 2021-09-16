<%-- 
    Document   : index
    Created on : 04-May-2021, 10:55:43 AM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .home-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Home</h2>
        </div>
        
        <!--Home-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 mb-5">
                    <div class="card">
                        <img class="card-img-top" src="img/appointment.jpg" alt="get appointment"/>
                        <div class="card-body">
                          <h5 class="card-title">Get Appointment</h5>
                          <p class="card-text">Book your appointment online with the our doctors. Get the best medical consultation & treatment with the best doctors.</p>
                          <a href="./getAppointment.jsp" class="btn btn-primary">Get Appointment</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 mb-5">
                    <div class="card">
                        <img class="card-img-top" src="img/doctors.jpg" alt="get appointment"/>
                        <div class="card-body">
                          <h5 class="card-title">Find Doctors</h5>
                          <p class="card-text">Find the right doctor, right now. Book your appointment online with out doctors. It's fast, easy, and free.</p>
                          <a href="./findDoctors.jsp" class="btn btn-primary">Find Doctors</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center">
            <h3>WHY CHOOSE US</h3>
            <label style="color: #333333">We have some special criteria that will help you</label>
        </div>
            
        <div class="container mt-3">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mb-3">
                    <h3 class="brand-name"><i class="fa fa-clock-o" aria-hidden="true"></i></h3>
                    <h4>Quick Response</h4>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mb-3">
                    <h3 class="brand-name"><i class="fa fa-thumbs-up" aria-hidden="true"></i></h3>
                    <h4>100% Satisfaction</h4>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mb-3">
                    <h3 class="brand-name"><i class="fa fa-globe" aria-hidden="true"></i></h3>
                    <h4>Quality Service</h4>
                </div>
            </div>
        </div>
        
        <%@include file="./component/service.jsp" %>
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>

    </body>
</html>
