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
        <title>Login | City Hospital</title>
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
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-5 text-right pt-3 pb-3">
                    <label>New User?</label> <a href="./registration.jsp" >Sign Up</a>
                </div>
            </div>
        </div>
        
        <div class="container mt-3 mb-3">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 login-page">
                    <div class="img-fluid" style="content: url('./img/login.png')"></div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    <h3 class="mt-3">Welcome Back!</h3>
                    <h6 style="color: #a1a1a1">Login to continue</h6>
                    <div id="loginpanel">
                        <div class="mt-5 mb-5">
                            <form id="loginForm">
                                <table cellpadding="5" style="width:100%">
                                    <tr id="status">
                                        <td class="text-center" colspan="2"><small id="statustext"></small></td>
                                    </tr>
                                    <tr>
                                        <td for="email">Email</td>
                                        <td>
                                            <input class="form-control" type="text" name="email" id="email" placeholder="Enter Email" value="" required="required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td for="password">Password</td>
                                        <td>
                                            <input class="form-control" type="password" name="password" id="password" placeholder="Enter Password" value="" required="required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input class="btn btn-primary mt-2" type="submit" value="Login" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="text-center">
                            <a onclick="changepanel()" class="login-link">Forgot password?</a>
                        </div>                        
                    </div>
                    
                    <div id="forgotpanel" style="display: none;">
                        <div class="mt-5 mb-5">
                            <form id="forgotForm">
                                <table cellpadding="2" style="width:100%">
                                    <tr id="rstatus">
                                        <td class="text-center" colspan="2"><small id="rstatustext"></small></td>
                                    </tr>
                                    <tr>
                                        <td for="femail">Email</td>
                                        <td>
                                            <input class="form-control" type="text" name="femail" id="femail" placeholder="Enter Email" value="" required="required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <label><a class="login-link" id="sendOTP">Send OTP</a></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td for="otp">OTP</td>
                                        <td>
                                            <input class="form-control" type="text" maxlength="6" name="fotp" id="otp" placeholder="OTP" value="" required="required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td for="fpassword">Password</td>
                                        <td>
                                            <input class="form-control" minlength="8" type="password" name="fpassword" id="fpassword" placeholder="Enter Password" value="" required="required" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input class="btn btn-primary mt-2" type="submit" value="Login" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div class="text-center">
                            <a onclick="changepanel()" class="login-link">Login?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="./component/script.jsp" %>
        <script src="./js/login.js" type="text/javascript"></script>
    </body>
</html>
