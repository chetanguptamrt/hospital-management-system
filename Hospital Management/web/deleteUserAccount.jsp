<%-- 
    Document   : deleteUserAccount
    Created on : 08-May-2021, 12:15:44 PM
    Author     : chetan
--%>

<%@page import="com.dao.UserDeleteDAO"%>
<%@page import="com.user.UserDetail"%>
<%
    try{
        UserDetail us = (UserDetail)session.getAttribute("userD");
        if(us!=null){
            if(request.getParameter("idF").equals("true")){
                UserDeleteDAO dao = new UserDeleteDAO();
                dao.deleteUser(us.getId());
            }
            session.removeAttribute("userD");
        }
        response.sendRedirect("./login.jsp");
    }
    catch(Exception e){
        
    }
%>