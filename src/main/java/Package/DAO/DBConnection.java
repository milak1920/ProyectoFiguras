package Package.DAO;

import Package.Util.MyProperties;

import java.sql.Connection;
import java.sql.DriverManager;

import java.util.Properties;

public class DBConnection {

    //propiedades
    MyProperties myProperties = new MyProperties();
    private static Connection connection = null;
    //Constructor
    private DBConnection(){
        try {
            Class.forName("org.sqlite.JDBC");
            Properties properties = myProperties.getProps();
            String jdbcStr = properties.getProperty("jdbcstring");
            connection = DriverManager.getConnection(jdbcStr);
            System.out.println("conectado!!");
           // return connection;
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


   public static Connection getConnection(){
        if(connection == null){
            new DBConnection();
        }
        return connection;
    }

    /*

      MyProperties myProperties = new MyProperties();
    Connection connection = null;
   public Connection getConnection(){
        try {
            Class.forName("org.sqlite.JDBC");
            Properties properties = myProperties.getProps();
            String jdbcStr = properties.getProperty("jdbcstring");
             connection = DriverManager.getConnection(jdbcStr);
            System.out.println("conectado!!");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


     */

}
