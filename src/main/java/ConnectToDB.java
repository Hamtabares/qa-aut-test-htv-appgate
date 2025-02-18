import java.sql.*;
import java.util.*;

public class ConnectToDB {

    public static List<Map<String, Object>> executeQuery(String query) {
        String url = "jdbc:postgresql://localhost:5432/test";
        String user = "admin";
        String password = "admin";

        List<Map<String, Object>> results = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            boolean hasResults = false;
            while (rs.next()) {
                hasResults = true;
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(metaData.getColumnName(i), rs.getObject(i));
                }
                results.add(row);
            }

        } catch (SQLException e) {
            System.err.println("Error al ejecutar la consulta: " + e.getMessage());
        }

        return results;
    }
}