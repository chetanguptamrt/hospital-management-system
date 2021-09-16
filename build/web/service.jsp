<%-- 
    Document   : service
    Created on : 04-May-2021, 1:19:20 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .service-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>Service | City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Service</h2>
        </div>        
        <%@include file="./component/service.jsp" %>
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>

    </body>
</html>
