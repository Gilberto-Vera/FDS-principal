package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {
    public static Connection getConexao(){
        String driver = "org.postgresql.Driver";
        String URL = "jdbc:postgresql://localhost/aps_bd1";
        String USUARIO = "gilberto";
        String SENHA = "123456";
        try {
            Class.forName(driver);
            Connection con;
            con = (Connection) DriverManager.getConnection(URL, USUARIO, SENHA);
            return con;
        } catch (SQLException e){
            System.err.print(e.getMessage());
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
