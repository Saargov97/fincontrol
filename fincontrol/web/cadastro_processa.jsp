<%@page import="java.sql.*" %>
<%@page import="database.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BancoDados bd = new BancoDados();
    Connection conexao = bd.getConexao();
    Statement st = conexao.createStatement();
    
    String cod_usuario = request.getParameter("cod_usuario");
    String nom_usuario = request.getParameter("nom_usuario");
    String nom_identificacao = request.getParameter("nom_identificacao");
    String des_email = request.getParameter("des_email");
    String des_senha = request.getParameter("des_senha");
    
    if(cod_usuario==null){
        st.execute("INSERT INTO usuario (nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) VALUES ('"+nom_usuario+"','"+nom_identificacao+"','"+des_senha+"','S','" +des_email+"');");
    }else if(cod_usuario!=null){
        if(des_senha == null || des_senha.equals("")){
            st.execute("UPDATE usuario "
                + "SET nom_usuario = '"+nom_usuario+"',"
                + "nom_identificacao = '"+nom_identificacao+"',"
                + "des_email = '"+des_email+"'"
                + "WHERE cod_usuario = '"+cod_usuario+"';");
        }else{
            st.execute("UPDATE usuario "
                + "SET nom_usuario = '"+nom_usuario+"',"
                + "nom_identificacao = '"+nom_identificacao+"',"
                + "des_senha = '"+des_senha+"',"
                + "des_email = '"+des_email+"'"
                + "WHERE cod_usuario = '"+cod_usuario+"';");
        }
    }
    response.sendRedirect("lista.jsp");
%>
