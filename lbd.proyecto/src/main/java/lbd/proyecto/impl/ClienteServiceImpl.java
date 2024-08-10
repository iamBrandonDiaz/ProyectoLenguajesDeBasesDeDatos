package lbd.proyecto.impl;

// External imports
import java.util.List;

import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// Internal imports
import lbd.proyecto.dao.ClienteDAO;
import lbd.proyecto.domain.Cliente;
import lbd.proyecto.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService {

    @Autowired
    private ClienteDAO clienteDAO;

    @Override
    @Transactional
    public void insertCliente(Cliente cliente) {
        clienteDAO.insertCliente(cliente.getNombre(), cliente.getApellido(), cliente.getTelefono(), cliente.getEmail());
    }
    
    @Override
    @Transactional
    public void updateCliente(Long idCliente, Cliente cliente) {
        clienteDAO.updateCliente(idCliente, cliente.getNombre(), cliente.getApellido(), cliente.getTelefono(), cliente.getEmail());
    }

    @Override
    @Transactional
    public Cliente getCliente(Cliente cliente) {
        return clienteDAO.getCliente(cliente.getIdCliente());

    }
}
