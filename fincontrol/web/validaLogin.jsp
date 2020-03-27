<%-- 
    Document   : validaLogin
    Created on : 11/03/2020, 12:10:17
    Author     : rafaelsiebeneichler
--%>

<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();

    Statement st = conexao.createStatement();

    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    ResultSet rs = st.executeQuery("SELECT 1 FROM usuario WHERE nom_usuario = '" + login + "' AND des_senha = MD5('" + senha + "')");
    if (rs.next()) {
        session.setAttribute("Login", login);
        response.sendRedirect("main.jsp");
    } else {
        session.setAttribute("Login", null);
        session.setAttribute("Falha", "Usuário e/ou senha inválidos. Verifique!");
        response.sendRedirect("index.jsp");
    }
%>
