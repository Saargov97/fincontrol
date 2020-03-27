<%-- 
    Document   : main
    Created on : 26/03/2020, 16:13:35
    Author     : Rafa_
--%>
<%@page import="support.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - FinControl</title>
        <%
          Utils u = new Utils();
          out.print(u.importar());
        %>
    </head>
    <body>
        <%
            out.print(u.menu());
        %>


    </body>
</html>
