package lbd.proyecto.service.direcciones;

// External imports
import java.util.List;

import lbd.proyecto.domain.Cliente;
// Internal imports
import lbd.proyecto.domain.direcciones.DireccionCliente;
import lbd.proyecto.domain.direcciones.Distrito;

public interface DireccionClienteService {
    
    // Method to save a new direction with the Stored Procedure
    void insertDireccionCliente(DireccionCliente direccionCliente, Cliente cliente, Distrito distrito);
}
