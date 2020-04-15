/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entity.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Rafa_
 */
public class UsuarioDB {

    public boolean Inserir(Usuario u) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            if (u.getCod_usuario().equals("0")) {
                ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(cod_usuario), 0) + 1 cod FROM usuario");
                if (rs.next()) {
                    u.setCod_usuario(rs.getString("cod"));
                } else {
                    u.setCod_usuario("1");
                }
            }
            st.execute("INSERT INTO usuario (cod_usuario,nom_usuario,nom_identificacao,des_senha,ind_ativo,des_email) "
                    + " VALUES (" + u.getCod_usuario() + ",'" + u.getNom_usuario() + "','" + u.getNom_identificacao() + "',md5('" + u.getDes_senha() + "'),'S','" + u.getDes_email() + "')");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Alterar(Usuario u) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            if (u.getDes_senha() == null || u.getDes_senha().isEmpty() || u.getDes_senha() == "") {
                st.execute("UPDATE usuario "
                        + " SET nom_usuario='" + u.getNom_usuario() + "',nom_identificacao='" + u.getNom_identificacao() + "',des_email='" + u.getDes_email() + "'"
                        + " WHERE cod_usuario=" + u.getCod_usuario() + "");
                return true;
            } else {
                st.execute("UPDATE usuario "
                        + " SET nom_usuario='" + u.getNom_usuario() + "',nom_identificacao='" + u.getNom_identificacao() + "',des_senha=md5('" + u.getDes_senha() + "'),des_email='" + u.getDes_email() + "'"
                        + " WHERE cod_usuario=" + u.getCod_usuario() + "");
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean Excluir(Usuario u) {
        return ExclusaoLogica(u);
    }

    private boolean ExclusaoLogica(Usuario u) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("UPDATE usuario SET ind_ativo ='N' WHERE cod_usuario=" + u.getCod_usuario() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean ExcluirDefinitivo(Usuario u) {
        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();
            st.execute("DELETE FROM usuario WHERE cod_usuario=" + u.getCod_usuario() + "");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
