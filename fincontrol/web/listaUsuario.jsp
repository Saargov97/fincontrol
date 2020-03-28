<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page import="support.Utils"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuários - FinControl</title>
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
                        <h3 class="text-left">Lista de usuários:</h3>
                        <a href="cadastroUsuario.jsp?oper=I&cod=0" class="btn btn-primary">Novo</a>         
                    </div>
                    <div class="row justify-content-between p-3 align-middle">
                        <div class="col-4"><b>Nome</b></div>
                        <div class="col-4"><b>E-mail</b></div>
                        <div class="col-3"></div>
                    </div>
                    <ul class="list-group">
                        <%
                            ConexaoBD conexao = new ConexaoBD();
                            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE ind_ativo = 'S' ORDER BY nom_identificacao");
                            while (rs.next()) {
                        %>
                        <div class="row justify-content-between p-3 border align-middle">
                            <div class="col-4" >
                                <%=rs.getString("nom_identificacao")%>
                            </div>
                            <div class="col-4" >
                                <%=rs.getString("des_email") != null ? rs.getString("des_email") : ""%>
                            </div>

                            <div class="col-3">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="cadastroUsuario.jsp?oper=A&cod=<%=rs.getString("cod_usuario")%>&login=<%=rs.getString("nom_usuario")%>&nome=<%=rs.getString("nom_identificacao")%>&email=<%=rs.getString("des_email")%>" class="btn btn-primary">Editar</a>
                                    <a href="usuario_DB.jsp?oper=E&cod=<%=rs.getString("cod_usuario")%>" class="btn btn-danger">Excluir</a>
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