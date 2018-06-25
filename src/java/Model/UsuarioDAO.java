package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author leoomoreira
 */
public class UsuarioDAO {

    public boolean checkLogin(String l, String p) {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery("SELECT login, password FROM `user` WHERE `login` = '" + l + "' AND `password` = '" + p + "'");
            while (rs.next()) {
                resultado = true;
            }
            rs.close();
            s.close();
            c.close();
            // } catch (ClassNotFoundException | SQLException ex) {
            //     Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            // }
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        return resultado;
    }

    public boolean newUser(String l, String p, String e, String n) {
        int rs = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            rs = s.executeUpdate("INSERT INTO `user` (`login`, `password`, `email`, `nick`) VALUES ('" + l + "', '" + p + "', '" + e + "', '" + n + "');");
            s.close();
            c.close();
            // } catch (ClassNotFoundException | SQLException ex) {
            //     Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            // }
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException x) {
            System.out.println(x);
            throw new RuntimeException(x);
        }
        return (rs != 0);
    }

    public boolean checkExist(String camp, String exist) {
        boolean resultado = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery("SELECT login, password FROM `user` WHERE `" + camp + "` = '" + exist + "'");
            while (rs.next()) {
                resultado = true;
            }
            rs.close();
            s.close();
            c.close();
            // } catch (ClassNotFoundException | SQLException ex) {
            //     Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            // }
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException x) {
            System.out.println(x);
            throw new RuntimeException(x);
        }
        return resultado;
    }

    public void rewardPoints(String user, int points) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            int rs = s.executeUpdate("UPDATE user SET points = points + " + points + " WHERE login = \"" + user + "\";");
            s.close();
            c.close();
            // } catch (ClassNotFoundException | SQLException ex) {
            //     Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            // }
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
    }

    public List<Usuario> getAll() {
        List<Usuario> resultado = new ArrayList<Usuario>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery("SELECT nick, points FROM user ORDER BY points DESC LIMIT 10");
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setPoints(rs.getInt("points"));
                u.setNick(rs.getString("nick"));
                resultado.add(u);
            }
            rs.close();
            s.close();
            c.close();
            // } catch (ClassNotFoundException | SQLException ex) {
            //     Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            // }
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }
        return resultado;
    }

}
