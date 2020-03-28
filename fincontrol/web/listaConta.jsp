<%-- 
    Document   : listaCC
    Created on : 26/03/2020, 17:38:40
    Author     : Rafa_
--%>

<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page import="support.Utils"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contas - FinControl</title>
        <%
         Utils u = new Utils();
         out.print(u.importar());
        %>
        <style>
            .center {
                width: 900px;
                overflow: auto;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -450px;
                margin-top: -300px;
            }
        </style>
    </head>

    <body>
        <%
             out.print(u.menu());
        %>

        <div class="container">

            <div class="row">
                <div class="center border p-5 shadow-sm">
                    <div class="row justify-content-between p-3 align-middle">
                        <h3 class="text-left">Lista de contas:</h3>
                        <a href="cadastroConta.jsp?oper=I&seq=0" class="btn btn-primary">Novo</a>         
                    </div>
                    <div class="row justify-content-between p-3 align-middle">
                        <div class="col-4"><b>Banco</b></div>
                        <div class="col-1"><b>Agênc.</b></div>
                        <div class="col-2"><b>Nº Conta</b></div>
                        <div class="col-2"><b>Tipo</b></div>
                        <div class="col-3"></div>
                    </div>
                    <ul class="list-group">
                        <%
                            ConexaoBD conexao = new ConexaoBD();
                            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                            ResultSet rs = st.executeQuery(""
                                    + " SELECT * FROM conta_corrente C "
                                    + " INNER JOIN banco B ON (B.seq_banco = C.seq_banco) "                                    
                                    + " INNER JOIN tipo_conta T ON (T.seq_tipo = C.ind_tipo_cc) "        
                                    + " WHERE C.ind_ativo = 'S'"
                                    + " ORDER BY B.cod_banco, C.cod_agencia, C.num_cc");
                            while (rs.next()) {
                        %>
                        <div class="row justify-content-between p-3 border align-middle">
                            <div class="col-4" >
                                <%=rs.getString("nom_banco")%>
                            </div>
                            <div class="col-1" >
                                <%=rs.getString("cod_agencia")%>
                            </div>
                            <div class="col-2" >
                                <%=rs.getString("num_cc")%>
                            </div>
                            <div class="col-2" >
                                <%=rs.getString("des_tipo")%>
                            </div>

                            <div class="col-3">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="cadastroConta.jsp?oper=A&seq=<%=rs.getString("seq_conta")%>&banco=<%=rs.getString("seq_banco")%>&agencia=<%=rs.getString("cod_agencia")%>&conta=<%=rs.getString("num_cc")%>&tipo=<%=rs.getString("ind_tipo_cc")%>" class="btn btn-primary">Editar</a>
                                    <a href="conta_DB.jsp?oper=E&seq=<%=rs.getString("seq_conta")%>" class="btn btn-danger">Excluir</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </body>

</html>