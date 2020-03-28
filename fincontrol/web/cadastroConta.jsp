<%-- 
    Document   : cadastroConta
    Created on : 26/03/2020, 17:45:50
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
        <title>Cadastro de Conta - FinControl</title>
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
                <form class=" center border p-5 shadow-sm" action="conta_DB.jsp">
                    <input type="hidden" name="oper" value="<%=request.getParameter("oper")%>" />
                    <input type="hidden" name="seq" value="<%=request.getParameter("seq")%>" />
                    <div class="form-group">       
                        <label for="inputState">Banco</label>
                        <select id="tipoBanco" name="banco" class="form-control">
                            <%
                                ConexaoBD conexao = new ConexaoBD();
                                Statement st = ConexaoBD.getInstance().getConnection().createStatement();
                                ResultSet rs = st.executeQuery("SELECT * FROM banco WHERE ind_ativo = 'S'");
                                while (rs.next()) {
                                  if (rs.getString("seq_banco").equals(request.getParameter("banco"))){
                            %>
                            <option selected value="<%=rs.getString("seq_banco")%>"><%=rs.getString("nom_banco")%></option>
                            <% } else { %>
                            <option value="<%=rs.getString("seq_banco")%>"><%=rs.getString("nom_banco")%></option>
                            <%       }     
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Agência</label>
                        <input type="number" class="form-control" name="agencia" value="<%=request.getParameter("agencia") != null?request.getParameter("agencia"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <div class="form-group">                  
                        <label for="exampleInputEmail1">Nº Conta</label>
                        <input type="text" class="form-control" name="conta" value="<%=request.getParameter("conta") != null?request.getParameter("conta"):""%>" aria-describedby="emailHelp"  required="required">
                    </div>
                    <div class="form-group">                 
                        <label for="inputState">Tipo</label>
                        <select id="tipoConta" name="tipo" class="form-control">
                            <%
                                rs = st.executeQuery("SELECT * FROM tipo_conta WHERE ind_ativo = 'S'");
                                while (rs.next()) {
                                    if (rs.getString("seq_tipo").equals(request.getParameter("tipo"))){
                            %>
                            <option selected value="<%=rs.getString("seq_tipo")%>"><%=rs.getString("des_tipo")%></option>
                            <% } else { %>
                            <option value="<%=rs.getString("seq_tipo")%>"><%=rs.getString("des_tipo")%></option>
                            <%       }     
                                }
                            %>
                        </select>                        
                    </div>                  
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <a href ="listaConta.jsp" class="btn btn-danger">Cancelar</a>
                </form>
            </div>
        </div>
    </body>

</html>