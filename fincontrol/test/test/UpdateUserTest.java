package test;

import database.ConexaoBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import org.junit.Test;
import static support.validaInsercao.validaInsercao;

public class UpdateUserTest {

    @Test
    public void updateUserTest() throws SQLException {

        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();;

        String oper = "A"; //padrão (A = operação de alteração do usuário no banco de dados)
        String codigo = "8"; //código do usuário a ser testado para alteração
        String login = "juca.bala.2"; //novo nom_usuario do usuário a ser alterado
        String nome = "Juca Bala 2"; //novo nom_identificação do usuário a ser alterado
        String email = "juca.bala.2@gmail.com"; //novo des_senha do usuário a ser alterado
        boolean alteracao = false;

        if (oper.equals("A")) {
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE cod_usuario=" + codigo + "");
            if ((!validaInsercao(login, email))) {
                st.execute("UPDATE usuario SET nom_usuario='" + login + "',nom_identificacao='" + nome + "',des_email='" + email + "' WHERE cod_usuario=" + codigo + "");
                alteracao = true;
                assertEquals(true, alteracao);
            } else {
                alteracao = false;
                assertEquals(true, alteracao);
            }
        }
    }
}
