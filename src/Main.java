/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Connection;
import model.Conexao;
import model.Login;


/**
 *
 * @author gilberto
 */
public class Main {

    public static Connection conexao;

    public static void main(String[] args) {
        
        conexao = new Conexao().getConexao();
        new Login().buscar();
//        new LoginFrm().setVisible(true);
        

    }

}
