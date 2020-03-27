<%-- 
    Document   : cadastraBanco
    Created on : 26/03/2020, 17:22:30
    Author     : Rafa_
--%>
<%@page import="support.Utils"%>	
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Banco - FinControl</title>
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
                <form class=" center border p-5 shadow-sm" action="banco_DB.jsp">
                    <input type="hidden" name="oper" value="<%=request.getParameter("oper")%>" />
                    <input type="hidden" name="seq" value="<%=request.getParameter("seq")%>" />
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Código</label>
                        <input type="text" class="form-control" name="cod" value="<%=request.getParameter("cod") != null?request.getParameter("cod"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Nome</label>
                        <input type="text" class="form-control" name="nome" value="<%=request.getParameter("nome") != null?request.getParameter("nome"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <a href ="listaBanco.jsp" class="btn btn-danger">Cancelar</a>
                </form>
            </div>
        </div>
    </body>

</html>