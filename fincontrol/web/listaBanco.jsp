<%-- 
    Document   : listaBanco
    Created on : 26/03/2020, 17:13:40
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
        <title>Bancos - FinControl</title>
        <%
         Utils u = new Utils();
         out.print(u.importar());
        %>
        <style>
            .center {
                width: 700px;
                overflow: auto;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -350px;
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
                        <h3 class="text-left">Lista de bancos:</h3>
                        <a href="cadastroBanco.jsp?oper=I&seq=0" class="btn btn-primary">Novo</a>         
                    </div>
                    <div class="row justify-content-between p-3 align-middle">
                        <div class="col-1"><b>Código</b></div>
                        <div class="col-6"><b>Nome</b></div>
                        <div class="col-3"></div>
                    </div>
                    <ul class="list-group">
                        <%
                            ConexaoBD conexao = new ConexaoBD();
                            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM banco WHERE ind_ativo = 'S' ORDER BY cod_banco");
                            while (rs.next()) {
                        %>
                        <div class="row justify-content-between p-3 border align-middle">
                            <div class="col-1" >
                                <%=rs.getString("cod_banco")%>
                            </div>
                            <div class="col-6" >
                                <%=rs.getString("nom_banco")%>
                            </div>

                            <div class="col-3">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="cadastroBanco.jsp?oper=A&seq=<%=rs.getString("seq_banco")%>&nome=<%=rs.getString("nom_banco")%>&cod=<%=rs.getString("cod_banco")%>" class="btn btn-primary">Editar</a>
                                    <a href="banco_DB.jsp?oper=E&seq=<%=rs.getString("seq_banco")%>" class="btn btn-danger">Excluir</a>
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