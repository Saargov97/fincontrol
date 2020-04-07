<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConexaoBD conexao = new ConexaoBD();
  
    Statement st = ConexaoBD.getInstance().getConnection().createStatement();;

    String oper = request.getParameter("oper");
    String codigo = request.getParameter("cod");
    String login = request.getParameter("nom_usuario");
    String nome = request.getParameter("nom_identificacao");
    String email = request.getParameter("des_email");
    String senha = request.getParameter("des_senha");

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
