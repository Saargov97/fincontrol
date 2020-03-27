<%@page import="support.Utils"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Usuário - FinControl</title>
        <%
            Utils u = new Utils();
            out.print(u.importar());
        %>
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
            out.print(u.menu());
        %>
        <div class="container">
            <div class="row">
                <form class=" center border p-5 shadow-sm" action="usuario_DB.jsp">
                    <input type="hidden" name="oper" value="<%=request.getParameter("oper")%>" />
                    <input type="hidden" name="cod" value="<%=request.getParameter("cod")%>" />
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Login</label>
                        <input type="text" class="form-control" name="login" value="<%=request.getParameter("login") != null?request.getParameter("login"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Nome</label>
                        <input type="text" class="form-control" name="nome" value="<%=request.getParameter("nome") != null?request.getParameter("nome"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Email/Login</label>
                        <input type="email" class="form-control" name="email" value="<%=request.getParameter("email") != null?request.getParameter("email"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <% if (!request.getParameter("oper").equals("A")) { %>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" name="senha" value="" required="required">
                    </div>
                    <% } %>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <a href ="listaUsuario.jsp" class="btn btn-danger">Cancelar</a>
                </form>
            </div>
        </div>
    </body>

</html>