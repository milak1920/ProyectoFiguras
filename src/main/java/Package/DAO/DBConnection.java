package Package.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection connection(){
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Mila/Documents/DESAWEBSEGUNDO/BaseDeDatos/prueba.db");
            System.out.println("conectado!!");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e+"");
        }
        return con;
    }
}
