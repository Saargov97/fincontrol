/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entity.Banco;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rafa_
 */
public class BancoDB {

    public boolean Inserir(Banco b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            if (b.getSeq_banco().equals("0")) {
                ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(seq_banco), 0) + 1 seq FROM banco");
                if (rs.next()) {
                    b.setSeq_banco(rs.getString("seq"));
                } else {
                    b.setSeq_banco("1");
                }
            }
            st.execute("INSERT INTO banco (seq_banco,nom_banco,cod_banco,ind_ativo) "
                    + " VALUES (" + b.getSeq_banco() + ",'" + b.getNom_banco() + "'," + b.getCod_banco() + ",'S')");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Alterar(Banco b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            st.execute("UPDATE banco SET nom_banco='" + b.getNom_banco() + "',cod_banco=" + b.getCod_banco() + " WHERE seq_banco=" + b.getSeq_banco() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Excluir(Banco b) {
        return ExclusaoLogica(b);
    }

    private boolean ExclusaoLogica(Banco b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            st.execute("UPDATE banco SET ind_ativo = 'N' WHERE seq_banco=" + b.getSeq_banco() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean ExcluirDefinitivo(Banco b) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            st.execute("DELETE FROM banco WHERE seq_banco=" + b.getSeq_banco() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
