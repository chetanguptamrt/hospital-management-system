<%-- 
    Document   : login
    Created on : 06-May-2021, 3:09:51 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/head.jsp" %>
        <title>Registration | City Hospital</title>
    </head>
    <body>
        <div class="container mt-3 mb-3 p-0" style="border-bottom: darkgray 1px solid">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-7">
                    <h2 class="brand-name brand-tag text-left pb-3 pt-3">
                        <a href="./index.jsp" class="brand-name-logo">
                            <i class="fa fa-heartbeat" aria-hidden="true"></i> City Hospital
                        </a>
                    </h2>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-5 text-right pt-3 pb-3">
                    <label>Already User?</label> <a href="./login.jsp" >Sign In</a>
                </div>
            </div>
        </div>
        <div class="container mt-3 mb-3">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 login-page">
                    <div class="img-fluid" style="content: url('./img/login.png')"></div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    <h3 class="mt-3">Welcome!</h3>
                    <h6 style="color: #a1a1a1">Registration to continue</h6>
                    <div class="mt-4 mb-">
                        <table cellpadding="5" style="width:100%">
                            <form id="registrationForm">
                                <tr id="status">
                                    <td class="text-center" colspan="2"><small id="statustext"></small></td>
                                </tr>
                                <tr>
                                    <td for="name">Name</td>
                                    <td>
                                        <input class="form-control" type="text" name="name" id="name" placeholder="Enter name" value="" required="required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td for="email">Email</td>
                                    <td>
                                        <input class="form-control" type="email" name="email" id="email" placeholder="Enter Email" value="" required="required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td for="password">Password</td>
                                    <td>
                                        <input class="form-control" type="password" name="password" id="password" placeholder="Enter Password" value="" required="required" minlength="8" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input class="btn btn-primary mt-2 mb-3" type="submit" value="Get OTP" />
                                    </td>
                                </tr>
                            </form>
                            <form id="otpForm">
                                <tr>
                                    <td for="otp">OTP</td>
                                    <td>
                                        <input class="form-control" type="text" name="otp" id="otp" placeholder="otp" maxlength="6" value="" required="required" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input class="btn btn-primary mt-2" type="submit" value="Save" />
                                    </td>
                                </tr>                                    
                            </form>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="./component/script.jsp" %>
        <script src="./js/registration.js" type="text/javascript"></script>
    </body>
</html>
