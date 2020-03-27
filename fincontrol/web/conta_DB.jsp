<%-- 
    Document   : conta_DB
    Created on : 26/03/2020, 17:50:54
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
    String seq_conta = request.getParameter("seq");
    String seq_banco = request.getParameter("banco");
    String cod_agencia = request.getParameter("agencia");
    String num_cc = request.getParameter("conta");
    String ind_tipo_cc = request.getParameter("tipo");

    if (oper.equals("A")) {
        st.execute("UPDATE conta_corrente "
                + " SET seq_banco=" + seq_banco + ",cod_agencia=" + cod_agencia + ",num_cc=" + num_cc + ",ind_tipo_cc=" + ind_tipo_cc 
                + " WHERE seq_conta=" + seq_conta + "");
    } else if (oper.equals("I")) {
        ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(seq_conta), 0) + 1 seq FROM conta_corrente");
        if (rs.next()) {
            seq_conta = rs.getString("seq");
        } else {
            seq_conta = "1";
        }
        st.execute("INSERT INTO conta_corrente (seq_conta,seq_banco,cod_agencia,num_cc,ind_tipo_cc,cod_usuario,ind_ativo) "
                + " VALUES (" + seq_conta + "," + seq_banco + "," + cod_agencia + ",'" + num_cc + "'," + ind_tipo_cc + ",3,'S')");
    } else if (oper.equals("E")) {
        st.execute("UPDATE conta_corrente SET ind_ativo ='N' WHERE seq_conta=" + seq_conta + "");
    }

    response.sendRedirect("listaConta.jsp");
%>