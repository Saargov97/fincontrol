<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<%@page import="support.Utils"%>
<%@page language="java" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload</title>
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

<HTML>
    <TITLE>Tela para upload do arquivo CSV</TITLE>

    <BODY>
        <FORM ENCTYPE="multipart/form-data" ACTION=
              "processaUpload.jsp" METHOD=POST>
            <br><br><br>
            <center><table border="2" >
                    <tr><center><td colspan="2"><p align=
                                                   "center"><B>Fazer upload</B><center></td></tr>
                            <tr><td><b>Escolha o arquivo para upload:</b>
                                </td>
                                <td><INPUT NAME="file" TYPE="file"></td></tr>
                            <tr><td colspan="2">
                                    <p align="right"><INPUT TYPE="submit" VALUE="Enviar arquivo" ></p></td></tr>
                            <table>
                        </center> 
                        </FORM>
                        </BODY>
                        </HTML>