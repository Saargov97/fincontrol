<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();
    Statement st = conexao.createStatement();
    
    String des_email = request.getParameter("des_email");
    String des_senha = request.getParameter("des_senha");
    
    ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE des_email LIKE '" + des_email + "' AND des_senha LIKE '" + des_senha + "'");
    if (!rs.next()) {
       response.sendRedirect("index.jsp"); ;
    } else {
       response.sendRedirect("lista.jsp"); 
    }
%>
