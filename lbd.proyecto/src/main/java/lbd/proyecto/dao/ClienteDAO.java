package lbd.proyecto.dao;

// External imports
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

// Internal imports
import lbd.proyecto.domain.Cliente;

public interface ClienteDAO extends JpaRepository<Cliente, Long> {
    
    // Method to call an stored procedure to insert a new client
    @Procedure(procedureName = "insertar_cliente")
    void insertCliente(String nombre, String apellidos, String telefono, String email);
    
    // Method to call an stored procedure to update a client
    @Procedure(procedureName = "actualizar_cliente")
    void updateCliente(Long idCliente, String nombre, String apellidos, String telefono, String email);

    
    
}
