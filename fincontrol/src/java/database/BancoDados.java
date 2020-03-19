//bancodados
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.*;

public class BancoDados {

    private Connection conexao = null;

    public BancoDados() {
        String nomeDriver = "org.postgresql.Driver";
        String localBancoDados = "jdbc:postgresql://localhost:5432/fincontrol";
        String usuario = "fincontrol";
        String senha = "fincontrl";

        try {
            Class.forName(nomeDriver).newInstance();
            conexao = DriverManager.getConnection(localBancoDados, usuario, senha);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConexao() {
        return conexao;
    }
}