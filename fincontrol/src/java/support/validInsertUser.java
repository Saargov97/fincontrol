package support;

import database.ConexaoBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class validInsertUser {

    public static boolean validInsert(String nom_usuario, String des_email) throws SQLException {

        ConexaoBD conexao = new ConexaoBD();
        Statement st = ConexaoBD.getInstance().getConnection().createStatement();

        ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE nom_usuario = '" + nom_usuario + "' OR des_email = '" + des_email + "'");
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }
}
