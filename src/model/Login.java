package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author gilberto
 */
public class Login {

    public void buscar() {
        
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Em qual banco deseja conectar 1 ou 2: ");
        int bd = sc.nextInt();
        
        if(bd == 1){
            System.out.println("Banco de dados PRINCIPAL");
            System.out.print("Nome: ");
            String nome = sc.next();
            System.out.print("Senha: ");
            String senha = sc.next();


            try {
                Connection con = Conexao1.getConexao();
                String query = "SELECT nome, senha FROM usuario WHERE nome = ? AND senha = ?";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, nome);
                ps.setString(2, senha);

                ResultSet rs = ps.executeQuery();
                if (rs.next()){
                    System.out.println("Login efetuado com sucesso");
                }
                else{
                    System.out.println("Nome ou senha incorreto");

                }
                con.close();

            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            
            System.out.println("Banco de dados PDV");
            System.out.print("Nome: ");
            String nome = sc.next();
            System.out.print("Senha: ");
            String senha = sc.next();


            try {
                Connection con = Conexao2.getConexao();
                String query = "SELECT nome, senha FROM secao_pdv WHERE nome = ? AND senha = ?";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, nome);
                ps.setString(2, senha);

                ResultSet rs = ps.executeQuery();
                if (rs.next()){
                    System.out.println("Login efetuado com sucesso");
                }
                else{
                    System.out.println("Nome ou senha incorreto");

                }
                con.close();

            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
