<%-- 
    Document   : logout
    Created on : 26/03/2020, 17:01:17
    Author     : Rafa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("Login");
    session.removeAttribute("Falha");

    response.sendRedirect("index.jsp");
%>
