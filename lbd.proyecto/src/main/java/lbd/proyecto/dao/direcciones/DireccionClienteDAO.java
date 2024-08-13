package lbd.proyecto.dao.direcciones;

import java.util.List;

// External imports
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import lbd.proyecto.domain.Cliente;
// Internal imports
import lbd.proyecto.domain.direcciones.DireccionCliente;

public interface DireccionClienteDAO extends JpaRepository<DireccionCliente, Long> {
    
    // Method to call an stored procedure to insert a new direction
    @Procedure(procedureName = "insertar_direccion_cliente")
    void insertDireccionCliente(Long idCliente, String detalles, Long idProvincia, Long idCanton, Long idDistrito);

    // Method to call an stored procedure to update a direction
    @Procedure(procedureName = "actualizar_direccion_cliente")
    void updateDireccionCliente(Long idDireccion, String detalles, Long idProvincia, Long idCanton, Long idDistrito);

    // Method to call an stored procedure to get a (single) distrito
    @Procedure(procedureName = "ver_direccion_cliente")
    DireccionCliente getDireccionCliente(Long idDireccion);

    // Method to call an stored procedure to get all distritos
    @Procedure(procedureName = "ver_direcciones_cliente")
    List<DireccionCliente> getAllDireccionesCliente();

    // Method to call a SQL function to get all the directions by client ID
    @Query(value = "SELECT * FROM TABLE(buscar_direcciones_cliente(:p_id_cliente))", nativeQuery = true)
    List<DireccionCliente> buscarDireccionesCliente(@Param("p_id_cliente") Long idCliente);

}
