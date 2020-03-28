package test;

import database.*;
import java.sql.Connection;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;

public class ConexaoTest {

    Connection conexao = null;

    @Test
    public void testarConexao() {
        assertNotEquals(conexao, ConexaoBD.getInstance().getConnection());
    }

}
