package test;

import database.*;
import java.sql.Connection;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class ConnectionTest {

    Connection conexao = null;//testa a conexão

    @Test
    public void connectionTest() {
        assertNotEquals(conexao, ConexaoBD.getInstance().getConnection());
    }

}
