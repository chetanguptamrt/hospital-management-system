<%-- 
    Document   : adminPanelLogin
    Created on : 06-May-2021, 11:10:59 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./adminHead.jsp" %>
        <style>
            .center{
                position: absolute;
                top: 50%;
                left: 50%;
                width: 370px;
                height: 260px;
                margin-top: -130px;
                margin-left: -185px;
                border:1px solid black;
                background-color: rgba(0,0,0,0.4);
            }
        </style>
    </head>
    <body style="background: url('../img/admin.jpg') no-repeat center center fixed; background-size: cover;">
        <div class="center">
            <h3 class="text-light text-center m-2">Admin Login</h3>
            <div class="text-center">
                <small id="status" class="text-danger" style="display:none;">Invalid username or password</small>
            </div>
            <form id="adminLogin">
                <table cellpadding="3" class="text-light table">
                    <tbody>
                        <tr>
                            <td style="border: none;" id="name">
                                Username
                            </td>
                            <td style="border: none;">
                                <input placeholder="Username" class="form-control" type="text" name="name" required="required" id="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none;" id="password">
                                Password
                            </td>
                            <td style="border: none;" >
                                <input placeholder="Password" class="form-control" type="password" name="password" required="required" id="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none;" class="text-center" colspan="2">
                                <input class="btn btn-outline-success" type="submit"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%@include file="../component/script.jsp" %>
        <script>
            $(document).ready(function(){
                $("#adminLogin").on("submit",function(event){
                    event.preventDefault();
                    var f = $(this).serialize();
                    $.ajax({
                        url:"../AdminLoginServlet",
                        data: f,
                        methos: "post",
                        success: function(data){
                            if(data.trim()==="done"){
                                location.href = "./adminPanel.jsp";
                            }
                            else{
                                $("#status").show();
                            }
                        },
                        error: function(){
                            $("status").show();
                        }
                    });
                });
            });
        </script>
    </body>
</html>
