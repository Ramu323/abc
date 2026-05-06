package jdbcdemo;

import java.sql.*;

public class JdbcClass {

    static final String DB_URL = "jdbc:mysql://localhost/sakila";
    static final String USER = "root";
    static final String PASS = "root";

    static final String query =
            "SELECT actor_id, first_name, last_name FROM actor";

    static final String insertquery =
            "insert into actor(actor_id,first_name,last_name) " +
            "value(1001,'satam','satam')";

    public static void main(String[] args) {

        try {

            Connection conn =
                    DriverManager.getConnection(DB_URL, USER, PASS);

            Statement stmt = conn.createStatement();

            // Insert data
            int insertResult = stmt.executeUpdate(insertquery);
            System.out.println("Rows inserted: " + insertResult);

            // Select and display data
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {

                System.out.println(
                        rs.getInt("actor_id") + "\t" +
                        rs.getString("first_name") + "\t" +
                        rs.getString("last_name")
                );
            }

        } catch (SQLException e) {

            System.out.println("error occurred");
            e.printStackTrace();
        }
    }
}