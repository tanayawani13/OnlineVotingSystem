package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            // Load Driver
            Class.forName("org.postgresql.Driver");

            // DB details
            String url = "jdbc:postgresql://localhost:5432/online_voting_db";
            String user = "postgres";
            String password = "1234";   // 🔴 CHANGE THIS

            con = DriverManager.getConnection(url, user, password);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}