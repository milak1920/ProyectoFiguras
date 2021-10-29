package Package.DAO;

import Package.Modelo.Figura;

import java.sql.*;


public class FiguraDaoImplem implements FiguraDao {
    DBConnection dataBase = new DBConnection();


    @Override
    public void insertar(Figura figura) {

        //conexion
        /*
        Connection con = DBConnection.connection();
        PreparedStatement ps;
        System.out.println(con);

         */
        Connection con = dataBase.getConnection();
        PreparedStatement ps;

        try {
            String sql = "INSERT INTO figura(tipoFigura, nombreFigura,grandor,coordX,coordY,colorFondo,colorBorde) VALUES(?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, figura.getTipoFigura());
            ps.setString(2, figura.getNombreFigura());
            ps.setInt(3,figura.getGrandor());
            ps.setInt(4,figura.getCoordX());
            ps.setInt(5,figura.getCoordY());
            ps.setString(6,figura.getColorFondo());
            ps.setString(7,figura.getColorBorde());
            ps.execute();
            System.out.println("Data has been inserted!");

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }
    }
}
