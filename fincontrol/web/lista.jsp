<%@page import="java.sql.*"%>
<%@page import="database.BancoDados"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            .center {
                width: 700px;
                height: 600px;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -350px;
                margin-top: -300px;
            }
        </style>
    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class=" center border p-5 shadow-sm">
                    <div class="row justify-content-between p-3 align-middle">
                        <h3 class="text-left">Lista de usuários:</h3>
                        <button class="btn btn-primary">Novo</button>
                    </div>
                    <ul class="list-group">
                        <%
                            BancoDados bd = new BancoDados();
                            Connection conexao = bd.getConexao();
                            Statement st = conexao.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM usuario");
                            while (rs.next()) {
                        %>
                        <div class="row justify-content-between p-3 border align-middle">
                            <div class="col-4" >
                              <%=rs.getString("cod_usuario") %>
                            </div>
                            <div class="col-4" >
                              <%=rs.getString("nom_usuario") %>
                            </div>
                           
                            <div class="col-4">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-primary">Editar</button>
                                    <button type="button" class="btn btn-danger">Excluir</button>
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