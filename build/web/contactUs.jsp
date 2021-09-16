<%-- 
    Document   : contactUs
    Created on : 04-May-2021, 1:19:05 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .contact-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>Contact | City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Contact Us</h2>
        </div>
        
        <div class="container mt-4">
            <div class="row mb-3">
                <div class="col-12">
                    <h2 class="text-center">Contact Us</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 text-center mb-2">
                    <i class="fa fa-phone contact-us" aria-hidden="true"></i>
                    <div>
                        <a class="top-link" href="tel:9876-543-321">9876-543-321</a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 text-center mb-2">
                    <i class="fa fa-envelope contact-us" aria-hidden="true"></i>
                    <div>
                        <a class="top-link" href="mailto:support@hospital.com">support@hospital.com</a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 text-center mb-2">
                    <i class="fa fa-map-marker contact-us" aria-hidden="true"></i>
                    <div>
                        City Hospital, Near Amar Ujala, Meerut <br/> UP, 250002
                    </div>
                </div>
            </div>
            
            <div class="row mt-4 mb-3">
                <div class="col-12">
                    <h2 class="text-center">Contact Form</h2>
                    <div class="text-center text-success" style="display: none" id="statusdiv">
                        <small id="status">Form submit successfully</small>
                    </div>
                </div>
            </div>
            
            <form id="contact">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 mb-4 align-self-center">
                        <input type="text" maxlength="30" value="" placeholder="Name" name="name" id="name" class="form-control" required="required" /><br/>
                        <input type="email" maxlength="50" value="" placeholder="Email" name="email" id="email" class="form-control" required="required" /><br/>
                        <input type="text" maxlength="15" value="" placeholder="Phone" name="phone" id="phone" class="form-control" required="required" /><br/>
                        <input type="text" maxlength="100" value="" placeholder="Subject (max-lenght: 100)" id="subject" name="subject" class="form-control" required="required" />
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 mb-4">
                        <textarea placeholder="Message (max-lenght: 1000)" maxlength="1000" name="message" class="form-control" rows="9" id="message" required="required"></textarea>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-success" >Send Message</button>
                    </div>
                </div>
            </form>
            
        </div>
        
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>
        <script>
            $(document).ready(function(){
                $("#contact").on("submit",function(event){
                    var f = $(this).serialize();
                    event.preventDefault();
                    $.ajax({
                        url: "./ContactServlet",
                        method: "post",
                        data: f,
                        success: function(data){
                            if(data.trim()==="done"){
                                document.getElementById("statusdiv").style.display = "block";
                                document.getElementById("status").innerHTML = "Form submit successfully";
                                $("#status").removeClass("text-danger");                                
                                $("#status").addClass("text-success");
                                document.getElementById("name").value = "";
                                document.getElementById("email").value = "";
                                document.getElementById("phone").value = "";
                                document.getElementById("subject").value = "";
                                document.getElementById("message").value = "";
                            }
                            else{
                                document.getElementById("statusdiv").style.display = "block";
                                document.getElementById("status").innerHTML = "Something went wrong!";
                                $("#status").addClass("text-danger");
                            }
                        },
                        error: function(){
                            document.getElementById("statusdiv").style.display = "block";
                            document.getElementById("status").innerHTML = "Something went wrong!";
                            $("#status").addClass("text-danger");
                        }
                    });
                });
            });
        </script>
    </body>
</html>
