package test;

import database.ConexaoBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import org.junit.Test;

public class DeleteUserTest {

    @Test
    public void deleteUserTest() throws SQLException {

        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();

        String oper = "E"; //padrão (E = operação de exclusão(desativação) do usuário no banco de dados)
        String codigo = "10"; //código do usuário a ser desativado no banco de dados
        boolean exclusao = false;

        if (oper.equals("E")) {
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE cod_usuario=" + codigo + "");
            if (rs.next()) {
                st.execute("UPDATE usuario SET ind_ativo = 'N' WHERE cod_usuario=" + codigo + "");
                exclusao = true;
                assertEquals(true, exclusao);
            } else {
                exclusao = false;
                assertEquals(true, exclusao);
            }
        }
    }
}
