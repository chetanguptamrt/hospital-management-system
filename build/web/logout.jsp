<%
    if(session.getAttribute("userD")!=null){
        session.removeAttribute("userD");
    }
    response.sendRedirect("./login.jsp");
%>