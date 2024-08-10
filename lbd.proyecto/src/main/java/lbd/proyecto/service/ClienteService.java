package lbd.proyecto.service;

// External imports
import java.util.List;

// Internal imports
import lbd.proyecto.domain.Cliente;

public interface ClienteService {
    
    // Method to save a new client with the Stored Procedure
    void insertCliente(Cliente cliente);

    // Method to update a client with the Stored Procedure
    void updateCliente(Long idCliente, Cliente cliente);

}
