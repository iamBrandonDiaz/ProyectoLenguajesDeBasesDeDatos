package lbd.proyecto.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import lbd.proyecto.domain.Camion;

public class CamionDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/tu_base_de_datos";
    private String jdbcUsername = "tu_usuario";
    private String jdbcPassword = "tu_contraseña";

    private static final String UPDATE_CAMION_SQL = "UPDATE camiones SET modelo = ?, marca = ?, anio = ? WHERE id = ?;";

    public CamionDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean actualizarCamion(Camion camion) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAMION_SQL)) {
            statement.setString(1, camion.getModelo());
            statement.setString(2, camion.getMarca());
            statement.setInt(3, camion.getAnio());
            statement.setInt(4, camion.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}

