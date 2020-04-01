/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package support;

/**
 *
 * @author Rafa_
 */
public class Utils {

    public String importar() {
        return ""
                + " <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\"\n"
                + "              integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n"
                + "        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n"
                + "        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>";
    }

    public String menu() {
        return ""
                + "<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n"
                + "            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n"
                + "                <span class=\"navbar-toggler-icon\"></span>\n"
                + "            </button>\n"
                + "\n"
                + "            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n"
                + "                <ul class=\"navbar-nav mr-auto\">\n"
                + "                    <li class=\"nav-item active\">\n"
                + "                        <a class=\"nav-link\" href=\"main.jsp#\">Home <span class=\"sr-only\">(current)</span></a>\n"
                + "                    </li>\n"
                + "                    <li class=\"nav-item dropdown\">\n"
                + "                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n"
                + "                            Cadastro\n"
                + "                        </a>\n"
                + "                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n"
                + "                            <a class=\"dropdown-item\" href=\"listaUsuario.jsp\">Usuário</a>\n"
                + "                            <a class=\"dropdown-item\" href=\"listaBanco.jsp\">Banco</a>\n"
                + "                            <a class=\"dropdown-item\" href=\"listaConta.jsp\">Conta Corrente</a>\n"
                + "                        </div>\n"
                + "                    </li>\n"
                + "                    <li class=\"nav-item dropdown\">\n"
                + "                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n"
                + "                            Upload\n"
                + "                        </a>\n"
                + "                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n"
                + "                            <a class=\"dropdown-item\" href=\"upload.jsp\">Fazer Upload</a>\n"
                + "                        </div>\n"
                + "                    </li>\n"
                + "                </ul>\n"
                + "                <form class=\"form-inline my-2 my-lg-0\">\n"
                + "                    <div class=\"sair\">\n"
                + "                        <a href=\"logout.jsp\" class=\"btn btn-danger justify-content-between p-3 align-middle\">Sair</a>        \n"
                + "                </form>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </nav>";
    }

}
