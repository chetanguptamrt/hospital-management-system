<%-- 
    Document   : adminLogOut.jsp
    Created on : 07-May-2021, 12:11:41 PM
    Author     : chetan
--%>

<%
    session.removeAttribute("adminD");
    response.sendRedirect("./adminPanelLogin.jsp");
%>