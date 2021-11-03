package Package.DAO;

import Package.Modelo.Usuario;

import java.sql.*;

public class UsuarioDaoImplem implements UsuarioDao {
    Connection con = DBConnection.getConnection();
    @Override
    public void agregar(Usuario usuario) {
        PreparedStatement ps;
         try {
             String sql = "INSERT INTO usuario(nombre, password) VALUES(?,?)";
             ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
             ps.setString(1, usuario.getNombre());
             ps.setString(2, usuario.getPassword());
             ps.execute();
             System.out.println("Data has been inserted!");
         } catch (SQLException e) {
            e.printStackTrace();
             System.out.println(e.toString());
        }
    }

    @Override
    public Usuario buscarUsuario(String nombre) {
        PreparedStatement ps;
        try {
            String sql = "select * from usuario where nombre = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1,nombre);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setUsuario_id(rs.getInt("usuario_id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setPassword(rs.getString("password"));
                return usuario;
             }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }
        return null;

    }


}
