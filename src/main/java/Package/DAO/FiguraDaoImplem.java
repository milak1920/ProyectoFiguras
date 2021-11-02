package Package.DAO;

import Package.Modelo.Figura;
import Package.Modelo.Usuario;

import java.sql.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;


public class FiguraDaoImplem implements FiguraDao {
    DBConnection dataBase = new DBConnection();
    Connection con = dataBase.getConnection();

    @Override
    public void insertar(Figura figura) {
        PreparedStatement ps;
        Timestamp ts = Timestamp.from(Instant.now());
       // SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
        System.out.println("nuevo formato");
        System.out.println(ts);
        System.out.println("fin");

        try {
            String sql = "INSERT INTO figura(tipoFigura,nombreFigura,fechaCreacion,grandor,coordX, coordY,colorFondo, colorBorde,usuario_id) VALUES(?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, figura.getTipoFigura());
            ps.setString(2, figura.getNombreFigura());

            ps.setTimestamp(3, ts );

            ps.setInt(4,figura.getGrandor());
            ps.setInt(5,figura.getCoordX());
            ps.setInt(6,figura.getCoordY());
            ps.setString(7,figura.getColorFondo());
            ps.setString(8,figura.getColorBorde());
            ps.setInt(9,figura.getUsuarioID());
            ps.execute();
            System.out.println("Data has been inserted!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }
    }

    @Override
    public List<Figura> busquedaFiguraUsuario(int usarioID) {
        List<Figura> resultat = new ArrayList<>();
        PreparedStatement ps;
        try {
            String sql = "select * from figura where usuario_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,usarioID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Figura figura = new Figura();
                figura.setFiguraId(rs.getInt("figura_id"));
                figura.setTipoFigura(rs.getString("tipoFigura"));
                figura.setNombreFigura(rs.getString("nombreFigura"));
                figura.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                figura.setGrandor(rs.getInt("grandor"));
                figura.setCoordX(rs.getInt("coordX"));
                figura.setCoordY(rs.getInt("coordY"));
                figura.setColorFondo(rs.getString("colorFondo"));
                figura.setColorBorde(rs.getString("colorBorde"));
                figura.setUsuarioID(rs.getInt("usuario_id"));
                resultat.add(figura);
            }
            System.out.println("Data has been inserted!");
            return resultat;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("cerrado db");
            }
        }
        return null;
    }


    @Override
    public Boolean borrarFigura(int idFigura) {
        PreparedStatement ps;
        try {
            String sql = "delete from figura where figura_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,idFigura);
            ps.execute();
            System.out.println("Borrado con exito!");
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }finally {
            try {
                System.out.println("cerrado db");
                con.close();
            } catch (SQLException ex) {
                System.out.println("error");
            }
        }
        return false;
    }

    @Override
    public List<Figura> busquedaFiguraOtros(int usarioID) {
        List<Figura> resultat = new ArrayList<>();
        PreparedStatement ps;
        try {
            String sql = "select * from figura where usuario_id != ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1,usarioID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Figura figura = new Figura();
                figura.setFiguraId(rs.getInt("figura_id"));
                figura.setTipoFigura(rs.getString("tipoFigura"));
                figura.setNombreFigura(rs.getString("nombreFigura"));
                figura.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                figura.setGrandor(rs.getInt("grandor"));
                figura.setCoordX(rs.getInt("coordX"));
                figura.setCoordY(rs.getInt("coordY"));
                figura.setColorFondo(rs.getString("colorFondo"));
                figura.setColorBorde(rs.getString("colorBorde"));
                figura.setUsuarioID(rs.getInt("usuario_id"));
                resultat.add(figura);
            }
            System.out.println("Data has been inserted!");
            return resultat;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("cerrado db");
            }
        }
        return null;
    }

    @Override
    public Figura buscarNombreFigura(String nombreFigura) {
        PreparedStatement ps;
        try {
            String sql = " select * from figura where nombreFigura = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1,nombreFigura);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Figura figura = new Figura();
                figura.setFiguraId(rs.getInt("figura_id"));
                figura.setTipoFigura(rs.getString("tipoFigura"));
                figura.setNombreFigura(rs.getString("nombreFigura"));
                figura.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
                figura.setGrandor(rs.getInt("grandor"));
                figura.setCoordX(rs.getInt("coordX"));
                figura.setCoordY(rs.getInt("coordY"));
                figura.setColorFondo(rs.getString("colorFondo"));
                figura.setColorBorde(rs.getString("colorBorde"));
                figura.setUsuarioID(rs.getInt("usuario_id"));
                return figura;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }
        return null;
    }


}
