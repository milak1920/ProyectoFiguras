package Package.DAO;

import Package.Util.MyProperties;

import java.sql.Connection;
import java.sql.DriverManager;

import java.util.Properties;

public class DBConnection {

    MyProperties myProperties = new MyProperties();

   public Connection getConnection(){
        try {
            Class.forName("org.sqlite.JDBC");
            Properties properties = myProperties.getProps();
            String jdbcStr = properties.getProperty("jdbcstring");
            Connection connection = DriverManager.getConnection(jdbcStr);
            System.out.println("conectado!!");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /*
    public static Connection connection(){
        Connection con = null;
        try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Mila/Documents/DESAWEBSEGUNDO/BaseDeDatos/mydatabase.db");
            System.out.println("conectado!!");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e+"");
        }
        return con;
    }*/
}
