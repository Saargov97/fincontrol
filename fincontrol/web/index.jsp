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
                <form action="index_processa.jsp" method="post" class="center border p-5 shadow-sm">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" name="des_email" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" name="des_senha" id="exampleInputPassword1">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Mantenha-me conectado</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Entrar</button>
                </form>
            </div>
        </div>
    </body>

</html>