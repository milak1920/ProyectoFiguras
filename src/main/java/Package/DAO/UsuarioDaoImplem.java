package Package.DAO;

import Package.Modelo.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDaoImplem implements UsuarioDao {

    @Override
    public void insert(Usuario usuario) {
        Connection con = DBConnection.connection();
        PreparedStatement ps;

         try {
             String sql = "INSERT INTO user(name, password) VALUES(?,?)";
             ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
             ps.setString(1, usuario.getUserName());
             ps.setString(2, usuario.getPassword());
             ps.execute();
             System.out.println("Data has been inserted!");


        } catch (SQLException e) {
            e.printStackTrace();
             System.out.println(e.toString());
        }


    }
}
