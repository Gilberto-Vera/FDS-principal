/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import model.Conexao1;
import model.Conexao2;
import model.Login;


/**
 *
 * @author gilberto
 */
public class Main {

    public static Connection conexao1;
    public static Connection conexao2;

    public static void main(String[] args) {
        
        conexao1 = new Conexao1().getConexao();
        conexao2 = new Conexao2().getConexao();
        new Login().buscar();
//        new LoginFrm().setVisible(true);
        

    }

}
