package test;

import database.ConexaoBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;

public class LoginTest {

    @Test
    public void loginTest() throws SQLException {
        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();

        String usuario = "teste1"; //nom_usuario cadastrado ou não no banco de dados
        String senha = "1234"; //des_senha cadastrada ou não no banco de dados
        boolean login = false;

        ResultSet rs = st.executeQuery("SELECT 1 FROM usuario WHERE nom_usuario = '" + usuario + "' AND des_senha = MD5('" + senha + "')");
        if (rs.next()) {
            login = true;
            assertEquals(true, login);
        } else {
            login=false;
            assertEquals(true, login);
        }
    }
}
