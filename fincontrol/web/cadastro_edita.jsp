<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Altera��o de Cadastro</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <style>
            .center {
                width: 500px;
                height: 500px;
                position: absolute;
                left: 50%;
                top: 50%;
                margin-left: -250px;
                margin-top: -250px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <form action="cadastro_processa.jsp" method="post" class=" center border p-5 shadow-sm">
                    <input type="hidden" name="cod_usuario" value="<%=request.getParameter("cod_usuario")%>" />
                    <div class="form-group">                  
                        <label for="Nome">Nome</label>
                        <input type="text" class="form-control" name="nom_identificacao" value="<%=request.getParameter("nom_identificacao")%>" />
                    </div>
                    <div class="form-group">                   
                        <label for="Usuario">Usu�rio</label>
                        <input type="text" class="form-control" name="nom_usuario" value="<%=request.getParameter("nom_usuario")%>" />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" name="des_email" aria-describedby="emailHelp" value="<%=request.getParameter("des_email")%>" />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" name="des_senha" id="exampleInputPassword1" />
                    </div>
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                    <a href="lista.jsp"><button type="button" class="btn btn-danger">Cancelar</button></a>
                </form>
            </div>
        </div>
    </body>

</html>