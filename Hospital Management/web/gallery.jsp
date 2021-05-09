<%-- 
    Document   : gallery
    Created on : 04-May-2021, 1:19:42 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .gallery-page{
                border-bottom: #1c8c19 solid 5px;
            }
        </style>
        <%@include file="./component/head.jsp" %>
        <title>Gallery | City Hospital</title>
    </head>
    <body>
        
        <%@include file="./component/navbar.jsp" %>
        <div style="background-image: url('./img/banner.png'); background-repeat: no-repeat; background-size: cover;" class="container-fluid p-0 m-0">
            <h2 class="banner" ><span style="border-left: 6px solid; border-color: #5bc555; padding-right: 6px"></span>Gallery</h2>
        </div>
        <div class="container mt-4 mb-4">
            <div class="row mb-2">
                <div class="col-12">
                    <h2 class="text-center">Photo Gallery</h2>
                </div>
            </div>
            <div class="row">
                <%
                    for(int i=2;i<=10;i++){
                %>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mb-4">
                            <div class="card img-fluid" style="content: url('img/photo-<%=i%>.png');"></div>
                        </div>
                <%
                    }
                %>
            </div>
        </div>
        
        <%@include file="./component/footer.jsp" %>
        <%@include file="./component/script.jsp" %>

    </body>
</html>
