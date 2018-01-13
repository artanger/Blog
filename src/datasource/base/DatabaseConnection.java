package datasource.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public Connection getConnection(){

        String uname = "root";
        String pass = "";
        String dbUrl = "jdbc:mysql://localhost:3306/mypost";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(dbUrl, uname, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
