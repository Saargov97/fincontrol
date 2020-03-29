package test;

import database.ConexaoBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;
import static support.validaInsercao.validaInsercao;

public class InsertUserTest {

    @Test
    public void insertUserTest() throws SQLException {

        ConexaoBD conexao = new ConexaoBD();

        Statement st = ConexaoBD.getInstance().getConnection().createStatement();;

        String oper = "I"; //padrão (I = operação de inserção de novo usuário no banco de dados)
        String codigo = null; //tem que ser null para ser um novo usuário
        String login = "juca.bala"; //campo usado no login (nom_usuario)
        String nome = "Juca Bala"; //campo de identificação (nom_identificacao)
        String email = "juca.bala@gmail.com"; //campo e-mail (des_email)
        String senha = "1234"; //campo usado no login (des_senha)
        boolean insercao = false;

        if (oper.equals("I")) {
            ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(cod_usuario), 0) + 1 seq FROM usuario");
            if (rs.next()) {
                codigo = rs.getString("seq");
            } else {
                codigo = "1";
            }
            if (!validaInsercao(login, email)) {
                insercao = true;
                assertEquals(true, insercao);
                st.execute("INSERT INTO usuario (cod_usuario,nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) "
                        + " VALUES (" + codigo + ",'" + login + "','" + nome + "',MD5('" + senha + "'),'S','" + email + "')");
            } else {
                insercao = false;
                assertEquals(true, insercao);
            }
        }
    }
}
