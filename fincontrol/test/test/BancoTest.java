package test;

import database.BancoDB;
import entity.Banco;
import static junit.framework.TestCase.assertEquals;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class BancoTest {

    BancoDB regra;
    Banco b;

    @Before
    public void start() {
        regra = new BancoDB();
        b = new Banco();
        b.setSeq_banco("999999999");
        b.setCod_banco("999");
        b.setNom_banco("TESTE - NÃO UTILIZAR");
    }

    @Test
    public void insertBancoTest() {
        assertEquals(true, regra.Inserir(b));
    }

    @Test
    public void updateBancoTest() {
        b.setCod_banco("789");
        b.setNom_banco("TESTE 2 - NÃO UTILIZAR");
        assertEquals(true, regra.Alterar(b));
    }

    @Test
    public void deleteBancoTest() {
        assertEquals(true, regra.Excluir(b));
    }

    @After
    public void clearBancoTest() {
        assertEquals(true, regra.ExcluirDefinitivo(b));
    }
}
