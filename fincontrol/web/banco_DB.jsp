<%-- 
    Document   : banco_DB
    Created on : 26/03/2020, 17:18:54
    Author     : Rafa_
--%>

<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();

    Statement st = conexao.createStatement();

    String oper = request.getParameter("oper");
    String seq = request.getParameter("seq");
    String nome = request.getParameter("nome");
    String codigo = request.getParameter("cod");

    if (oper.equals("A")) {
        st.execute("UPDATE banco SET nom_banco='" + nome + "',cod_banco=" + codigo + " WHERE seq_banco=" + seq + "");
    } else if (oper.equals("I")) {
        ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(seq_banco), 0) + 1 seq FROM banco");
        if (rs.next()) {
            seq = rs.getString("seq");
        } else {
            seq = "1";
        }
        st.execute("INSERT INTO banco (seq_banco,nom_banco,cod_banco,ind_ativo) "
                + " VALUES (" + seq + ",'" + nome + "'," + codigo + ",'S')");
    } else if (oper.equals("E")) {
        st.execute("UPDATE banco SET ind_ativo ='N' WHERE seq_banco=" + seq + "");
    }

    response.sendRedirect("listaBanco.jsp");
%>
