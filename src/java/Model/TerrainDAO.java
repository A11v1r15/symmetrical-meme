/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alvaro
 */
public class TerrainDAO {
    
    public Terrain getTerrain(String coord) {
        Terrain terrain = new Terrain();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/a11v1r15_symmetrical-meme?useTimezone=true&serverTimezone=UTC";
            String usuario = "root";
            String senha = "";
            //String Driver="";
            Connection c = DriverManager.getConnection(url, usuario, senha);
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM terrain, user WHERE terrain.coord = \""+coord+"\" AND user.id = 0");
            while (rs.next()) {
                terrain.setId(rs.getInt("id"));
                terrain.setUser_id(rs.getInt("user_id"));
                terrain.setHp(rs.getInt("hp"));
                terrain.setCoord(rs.getString("coord"));
                terrain.setImage(rs.getString("image"));
            }
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
        return terrain;
    }
    
}