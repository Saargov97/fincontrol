/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import database.ContaCorrenteDB;
import entity.ContaCorrente;
import static junit.framework.TestCase.assertEquals;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ContaCorrenteTest {

    ContaCorrenteDB regra;
    ContaCorrente cc;

    @Before
    public void start() {
        regra = new ContaCorrenteDB();
        cc = new ContaCorrente();
        cc.setSeq_conta("999999999");
        cc.setSeq_banco("1");
        cc.setCod_usuario("3");
        cc.setCod_agencia("879");
        cc.setNum_cc("87940564X");
        cc.setInd_tipo_cc("1");
    }

    @Test
    public void insertContaCorrenteTest() {
        assertEquals(true, regra.Inserir(cc));
    }

    @Test
    public void updateContaCorrenteTest() {
        cc.setCod_agencia("6701");
        cc.setNum_cc("046413201X");
        cc.setInd_tipo_cc("2");
        assertEquals(true, regra.Alterar(cc));
    }

    @Test
    public void deleteContaCorrenteTest() {
        assertEquals(true, regra.Excluir(cc));
    }

    @After
    public void clearBancoTest() {
        assertEquals(true, regra.ExcluirDefinitivo(cc));
    }
}

