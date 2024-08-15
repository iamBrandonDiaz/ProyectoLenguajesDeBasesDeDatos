package lbd.proyecto.dao;

// External imports
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import java.util.List;

// Internal imports
import lbd.proyecto.domain.Vehiculo;

public interface VehiculoDAO extends JpaRepository<Vehiculo, Long> {
    
    // Method to call an stored procedure to get a (single) vehicle
    @Procedure(procedureName = "ver_vehiculo")
    Vehiculo getVehiculo(Long idVehiculo);

    //Method to call an stored procedure to get all vehicles
    @Procedure(procedureName = "ver_vehiculos")
    List<Vehiculo> getAllVehiculos();
    
}
