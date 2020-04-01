<%@page import="java.io.File"%>
<%

            //response.wait(3000);
            String caminho = "C:/temp";
            String pasta = "temp";

            File imagem = new File(caminho);

            String[] list = imagem.list();

            if (list.length > 0) {
                for (String s : list) {
                    out.println("");
                    out.println("<img src=\"" + pasta + "/" + s + "\" height=\"150px\" style=\"border: #ffcc66 Solid 1px;\">");
                }
            }

            
%>