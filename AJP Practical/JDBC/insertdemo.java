package jdbcdemo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class insertdemo {

    static final String DB_URL = "jdbc:mysql://localhost/sakila";
    static final String USER = "root";
    static final String PASS = "root";

        static final String insertquery =
            "insert into actor(actor_id,first_name,last_name) values(?, ?, ?)";

    public static void main(String[] args) {

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement stmt = conn.prepareStatement(insertquery)) {

            stmt.setInt(1, 1003);
            stmt.setString(2, "prathamesh");
            stmt.setString(3, "galande");

            int rowsInserted = stmt.executeUpdate();

            System.out.println("Data inserted: " + rowsInserted);

        } catch (SQLException e) {

            System.out.println("error occurred");
            e.printStackTrace();
        }
    }
}