<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();
    Statement st = conexao.createStatement();
    
    String cod_usuario = request.getParameter("cod_usuario");
    if(cod_usuario!=null){
        st.execute("DELETE FROM usuario WHERE cod_usuario= "+cod_usuario);
    }
    response.sendRedirect("lista.jsp"); 
%>