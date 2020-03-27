<%-- 
    Document   : usuario_DB
    Created on : 11/03/2020, 08:55:26
    Author     : rafaelsiebeneichler
--%>

<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();

    Statement st = conexao.createStatement();

    String oper = request.getParameter("oper");
    String codigo = request.getParameter("cod");
    String login = request.getParameter("login");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    if (oper.equals("A")) {
        st.execute("UPDATE usuario SET nom_usuario='" + login + "',nom_identificacao='" + nome + "',des_email='" + email + "' WHERE cod_usuario=" + codigo + "");
    } else if (oper.equals("I")) {
        ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(cod_usuario), 0) + 1 seq FROM usuario");
        if (rs.next()) {
            codigo = rs.getString("seq");
        } else {
            codigo = "1";
        }
        /* throw new RuntimeException("INSERT INTO usuario (cod_usuario,nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) "
                    + " VALUES (" + codigo + ",'" + login + "','" + nome + "',MD5('" + senha + "'),'S','" + email + "')");
            request.setAttribute("alertMsg", "INSERT INTO usuario (cod_usuario,nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) "
                    + " VALUES (" + codigo + "," + login + "," + nome + "',MD5(" + senha + "),S," + email + "')");*/
        st.execute("INSERT INTO usuario (cod_usuario,nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) "
                + " VALUES (" + codigo + ",'" + login + "','" + nome + "',MD5('" + senha + "'),'S','" + email + "')");
    } else if (oper.equals("E")) {
        st.execute("UPDATE usuario SET ind_ativo ='N' WHERE cod_usuario=" + codigo + "");
    }

    response.sendRedirect("listaUsuario.jsp");
%>
