<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - FinControl</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            .center {
                width: 500px;
                overflow: auto;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -250px;
                margin-top: -250px;
            }
        </style>
    </head>

    <body>
        <%
            String chave = (String) session.getAttribute("Login");
            if (chave == null) {
        %>
        <div class="container">
            <div class="row">
                <form class="center border p-5 shadow-sm" action="validaLogin.jsp" method="POST">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Login</label>
                        <input type="text" class="form-control" name="login" aria-describedby="emailHelp">

                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" name="senha">
                    </div>
                    <%
                        String falha = (String) session.getAttribute("Falha");
                        if (falha != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=falha%>
                    </div>
                    <%
                        }
                    %>
                    <button type="summit" class="btn btn-primary">Entrar</button>            
                </form>
            </div>
        </div>
        <%
            } else {
                response.sendRedirect("main.jsp");
            }
        %>
    </body>

</html>