package test;

import database.ConexaoBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static junit.framework.TestCase.assertEquals;
import static org.junit.Assert.assertNotEquals;
import org.junit.Test;
import static support.validInsertUser.validInsert;

public class TestUser {

    Connection conexao = null;//testa a conexão

    @Test
    public void connectionTest() {
        assertNotEquals(conexao, ConexaoBD.getInstance().getConnection());
    }

    @Test
    public void loginTest() throws SQLException {
        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();

        String usuario = "juca.bala.1"; //nom_usuario cadastrado ou não no banco de dados
        String senha = "1234"; //des_senha cadastrada ou não no banco de dados
        boolean login = false;

        ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE nom_usuario = '" + usuario + "' AND des_senha = MD5('" + senha + "')");
        if (rs.next()) {
            login = true;
            assertEquals(true, login);
        } else {
            login = false;
            assertEquals(true, login);
        }
    }

    @Test
    public void insertUserTest() throws SQLException {

        ConexaoBD conexao = new ConexaoBD();

        Statement st = ConexaoBD.getInstance().getConnection().createStatement();;

        String oper = "I"; //padrão (I = operação de inserção de novo usuário no banco de dados)
        String codigo = null; //tem que ser null para ser um novo usuário
        String login = "pretto3"; //campo usado no login (nom_usuario)
        String nome = "PrettoV3"; //campo de identificação (nom_identificacao)
        String email = "prettov3@gmail.com"; //campo e-mail (des_email)
        String senha = "1234"; //campo usado no login (des_senha)
        boolean insercao = false;

        if (oper.equals("I")) {
            ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(cod_usuario), 0) + 1 seq FROM usuario");
            if (rs.next()) {
                codigo = rs.getString("seq");
            } else {
                codigo = "1";
            }
            if (!validInsert(login, email)) {
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

    @Test
    public void updateUserTest() throws SQLException {

        Statement st = ConexaoBD.getInstance().getConnection().createStatement();;

        String oper = "A"; //padrão (A = operação de alteração do usuário no banco de dados)
        String codigo = "15"; //código do usuário a ser testado para alteração
        String login = "pretto.2"; //novo nom_usuario do usuário a ser alterado
        String nome = "Preto V2"; //novo nom_identificação do usuário a ser alterado
        String email = "pretto.2@gmail.com"; //novo des_senha do usuário a ser alterado
        boolean alteracao = false;

        if (oper.equals("A")) {
            ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE cod_usuario=" + codigo + "");
            if ((!validInsert(login, email))) {
                st.execute("UPDATE usuario SET nom_usuario='" + login + "',nom_identificacao='" + nome + "',des_email='" + email + "' WHERE cod_usuario=" + codigo + "");
                alteracao = true;
                assertEquals(true, alteracao);
            } else {
                alteracao = false;
                assertEquals(true, alteracao);
            }
        }
    }

    @Test
    public void deleteUserTest() throws SQLException {

        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();

        String oper = "E"; //padrão (E = operação de exclusão(desativação) do usuário no banco de dados)
        String codigo = "12"; //código do usuário a ser desativado no banco de dados
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
