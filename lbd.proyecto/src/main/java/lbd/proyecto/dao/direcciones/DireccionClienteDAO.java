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
    
    // // Method to call an stored procedure to insert a new direction
    // @Procedure(procedureName = "insertar_direccion_cliente")
    // void insertCliente();
    
    // // Method to call an stored procedure to update a client
    // @Procedure(procedureName = "actualizar_cliente")
    // void updateCliente(Long idCliente, String nombre, String apellidos, String telefono, String email);

    // // Method to call an stored procedure to get a (single) client
    // @Procedure(procedureName = "ver_cliente")
    // Cliente getCliente(Long idCliente);
    
    // //Method to call an stored procedure to get all clients
    // @Procedure(procedureName = "ver_clientes")
    // List<Cliente> getAllClientes();

    // //Method to call an stored procedure to delete a client
    // @Procedure(procedureName = "eliminar_cliente")
    // void deleteCliente(Long idCliente);

    // //Method to call a SQL function to get all the clients that match the string in their name
    // @Query(value = "SELECT * FROM TABLE(buscar_clientes_nombre(:p_nombre))", nativeQuery = true)
    // List<Cliente> buscarClientes(@Param("p_nombre") String nombre);

    // //Method to call a SQL function to get all the clients that match the string in their email
    // @Query(value = "SELECT * FROM TABLE(buscar_clientes_email(:p_email))", nativeQuery = true)
    // List<Cliente> buscarClientesEmail(@Param("p_email") String email);

}
