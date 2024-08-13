package lbd.proyecto.impl.direcciones;

// External imports
import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
import org.hibernate.Session;
import org.hibernate.jdbc.Work;

import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.PersistenceException;
import jakarta.persistence.StoredProcedureQuery;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;

// Internal imports
import lbd.proyecto.dao.direcciones.DireccionClienteDAO;
import lbd.proyecto.domain.direcciones.DireccionCliente;
import lbd.proyecto.service.direcciones.DireccionClienteService;

import lbd.proyecto.domain.Cliente;
import lbd.proyecto.service.ClienteService;
import lbd.proyecto.dao.ClienteDAO;

import lbd.proyecto.domain.direcciones.Distrito;
import lbd.proyecto.service.direcciones.DistritoService;
import lbd.proyecto.dao.direcciones.DistritoDAO;

@Service
public class DireccionClienteServiceImpl implements DireccionClienteService {
    
    @Autowired
    private DireccionClienteDAO direccionClienteDAO;

    @Autowired
    private DistritoService distritoService;

    @Autowired
    private ClienteService clienteService;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void insertDireccionCliente(DireccionCliente direccionCliente, Cliente cliente, Distrito distrito) {
        Distrito distritoResult = distritoService.getDistrito(distrito);
        Cliente clienteResult = clienteService.getCliente(cliente);
        direccionClienteDAO.insertDireccionCliente(cliente.getIdCliente(), direccionCliente.getDetalles(), distritoResult.getCanton().getProvincia().getIdProvincia(), distritoResult.getCanton().getIdCanton(), distritoResult.getIdDistrito());

        direccionCliente.setCliente(clienteResult);
        direccionCliente.setDistrito(distritoResult);
        System.out.println(direccionCliente.toString());
    }

}
