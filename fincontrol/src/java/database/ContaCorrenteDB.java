/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entity.ContaCorrente;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rafa_
 */
public class ContaCorrenteDB {

    public boolean Inserir(ContaCorrente cc) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            if (cc.getSeq_conta().equals("0")) {
                ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(seq_conta), 0) + 1 seq FROM conta_corrente");
                if (rs.next()) {
                    cc.setSeq_conta(rs.getString("seq"));
                } else {
                    cc.setSeq_conta("1");
                }
            }
            st.execute("INSERT INTO conta_corrente (seq_conta,seq_banco,cod_agencia,num_cc,ind_tipo_cc,cod_usuario,ind_ativo) "
                    + " VALUES (" + cc.getSeq_conta() + "," + cc.getSeq_banco() + "," + cc.getCod_agencia() + ",'" + cc.getNum_cc() + "'," + cc.getInd_tipo_cc() + ",1,'S')");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Alterar(ContaCorrente cc) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("UPDATE conta_corrente "
                    + " SET seq_banco=" + cc.getSeq_banco() + ",cod_agencia=" + cc.getCod_agencia() + ",num_cc='" + cc.getNum_cc() + "',ind_tipo_cc=" + cc.getInd_tipo_cc()
                    + " WHERE seq_conta=" + cc.getSeq_conta() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Excluir(ContaCorrente cc) {
        return ExclusaoLogica(cc);
    }

    private boolean ExclusaoLogica(ContaCorrente cc) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("UPDATE conta_corrente SET ind_ativo ='N' WHERE seq_conta=" + cc.getSeq_conta() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean ExcluirDefinitivo(ContaCorrente cc) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("DELETE FROM conta_corrente WHERE seq_banco=" + cc.getSeq_conta() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
