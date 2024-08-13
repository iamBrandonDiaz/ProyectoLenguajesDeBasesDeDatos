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

}
