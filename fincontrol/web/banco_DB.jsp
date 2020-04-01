<%-- 
    Document   : banco_DB
    Created on : 26/03/2020, 17:18:54
    Author     : Rafa_
--%>

<%@page import="java.sql.*" %>
<%@page import="database.BancoDB" %>
<%@page import="entity.Banco" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDB regra = new BancoDB();
    Banco b = new Banco();

    String oper = request.getParameter("oper");
    b.setSeq_banco(request.getParameter("seq"));
    b.setNom_banco(request.getParameter("nome"));
    b.setCod_banco(request.getParameter("cod"));

    if (oper.equals("A")) {
        regra.Alterar(b);
    } else if (oper.equals("I")) {
        regra.Inserir(b);
    } else if (oper.equals("E")) {
        regra.Excluir(b);
    }

    response.sendRedirect("listaBanco.jsp");
%>
