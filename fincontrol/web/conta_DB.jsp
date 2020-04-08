<%@page import="java.sql.*" %>
<%@page import="database.ContaCorrenteDB" %>
<%@page import="entity.ContaCorrente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ContaCorrenteDB regra = new ContaCorrenteDB();
    ContaCorrente cc = new ContaCorrente();
    
    System.out.println("CODIGO AGENCIA: "+request.getParameter("cod_agencia"));
    System.out.println("NUMERO CONTA: "+request.getParameter("num_cc"));

    String oper = request.getParameter("oper");
    cc.setSeq_conta(request.getParameter("seq"));
    cc.setSeq_banco(request.getParameter("seq_banco"));
    cc.setCod_agencia(request.getParameter("cod_agencia"));
    cc.setNum_cc(request.getParameter("num_cc"));
    cc.setInd_tipo_cc(request.getParameter("ind_tipo_cc"));
    
    if (oper.equals("A")) {
        regra.Alterar(cc);
    } else if (oper.equals("I")) {
        regra.Inserir(cc);
    } else if (oper.equals("E")) {
        regra.Excluir(cc);
    }

    response.sendRedirect("listaConta.jsp");
%>