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
import lbd.proyecto.dao.direcciones.DireccionPedidoDAO;
import lbd.proyecto.domain.direcciones.DireccionPedido;
import lbd.proyecto.service.direcciones.DireccionPedidoService;

import lbd.proyecto.domain.Pedido;
import lbd.proyecto.service.PedidoService;
import lbd.proyecto.dao.PedidoDAO;

import lbd.proyecto.domain.direcciones.Distrito;
import lbd.proyecto.service.direcciones.DistritoService;
import lbd.proyecto.dao.direcciones.DistritoDAO;

@Service
public class DireccionPedidoServiceImpl implements DireccionPedidoService {
    
    @Autowired
    private DireccionPedidoDAO direccionPedidoDAO;

    @Autowired
    private DistritoService distritoService;

    @Autowired
    private PedidoService pedidoService;

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private TransactionTemplate transactionTemplate;

    @Override
    @Transactional
    public void insertDireccionPedido(DireccionPedido direccionPedido, Pedido pedido, Distrito distrito) {
        Distrito distritoResult = distritoService.getDistrito(distrito);
        Pedido pedidoResult = pedidoService.getPedido(pedido);
        direccionPedidoDAO.insertDireccionPedido(pedidoResult.getIdPedido(), direccionPedido.getDetalles(), distritoResult.getCanton().getProvincia().getIdProvincia(), distritoResult.getCanton().getIdCanton(), distritoResult.getIdDistrito());    
    }

    @Override
    @Transactional
    public void updateDireccionPedido(DireccionPedido direccionPedido, Distrito distrito) {
        Distrito distritoResult = distritoService.getDistrito(distrito);
        direccionPedidoDAO.updateDireccionPedido(direccionPedido.getIdDireccion(), direccionPedido.getDetalles(), distritoResult.getCanton().getProvincia().getIdProvincia(), distritoResult.getCanton().getIdCanton(), distritoResult.getIdDistrito());
    }

    @Override
    @Transactional
    public void deleteDireccionPedido(DireccionPedido direccionPedido) {
        direccionPedidoDAO.deleteDireccionPedido(direccionPedido.getIdDireccion());
    }

    @Override
    @Transactional
    public DireccionPedido getDireccionPedido(DireccionPedido direccionPedido) {
        
    }

}
