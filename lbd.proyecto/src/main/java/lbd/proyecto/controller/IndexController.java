package lbd.proyecto.controller;

import java.util.List;

import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lbd.proyecto.domain.Cliente;
import lbd.proyecto.domain.direcciones.Canton;
import lbd.proyecto.domain.direcciones.DireccionCliente;
import lbd.proyecto.domain.direcciones.Distrito;
import lbd.proyecto.service.direcciones.CantonService;
import lbd.proyecto.service.direcciones.DireccionClienteService;
import lbd.proyecto.service.direcciones.DistritoService;
import lbd.proyecto.domain.direcciones.Provincia;
import lbd.proyecto.service.direcciones.ProvinciaService;

@Controller
public class IndexController {

    @Autowired
    ProvinciaService provinciaService;

    @Autowired
    CantonService cantonService;

    @Autowired
    DistritoService distritoService;

    @Autowired
    DireccionClienteService direccionClienteService;
    
    // Muestra la página principal
    @RequestMapping("/")
    public String page(Model model) {
        //Test getProvincia and getAllProvincias
        // Provincia provincia = new Provincia();
        // provincia.setIdProvincia(3L);
        // Provincia provinciaResult = provinciaService.getProvincia(provincia);
        // System.out.println(provinciaResult.toString());
        
        // List<Provincia> provincias = provinciaService.getAllProvincias();
        // for (Provincia p : provincias) {
        //     System.out.println(p.toString());
        // }
        
        //Test getCanton and getAllCantones
        // Canton canton = new Canton();
        // canton.setIdCanton(1L);
        // Canton cantonResult = cantonService.getCanton(canton);
        // System.out.println(cantonResult.toString());

        // List<Canton> cantones = cantonService.getAllCantones();
        // for (Canton c : cantones) {
        //     System.out.println(c.toString());
        // }

        // Test getDistrito and getAllDistritos
        System.out.println("NUEVO TEST");
        // Distrito distrito = new Distrito();
        // distrito.setIdDistrito(25L);
        // Distrito distritoResult = distritoService.getDistrito(distrito);
        // System.out.println(distritoResult.toString());

        // List<Distrito> distritos = distritoService.getAllDistritos();
        // for (Distrito d : distritos) {
        //     System.out.println(d.toString());
        // }

        //Test addDireccion_Clientes
        // DireccionCliente direccionCliente = new DireccionCliente("Nueva direccion", distritoResult);
        // Cliente cliente = new Cliente();
        // cliente.setIdCliente(2L);
        // System.out.println(direccionCliente.toString());
        // direccionClienteService.insertDireccionCliente(direccionCliente, cliente, distritoResult);

        //Test updateDireccion_Clientes
        // DireccionCliente direccionCliente = new DireccionCliente();
        // direccionCliente.setIdDireccion(7L);
        // direccionCliente.setDetalles("Fix Direccion 3");

        // Distrito distrito2 = new Distrito();
        // distrito2.setIdDistrito(25L);
        // direccionCliente.setDistrito(distrito2);

        // System.out.println("TEST");
        // System.out.println(direccionCliente.toString());
        // System.out.println(direccionCliente.getDistrito().toString());
        // direccionClienteService.updateDireccionCliente(direccionCliente, direccionCliente.getDistrito());

        //Test getDireccion_Clientes
        DireccionCliente direccionCliente = new DireccionCliente();
        direccionCliente.setIdDireccion(1L);
        DireccionCliente direccionClienteResult = direccionClienteService.getDireccionCliente(direccionCliente);
        System.out.println(direccionClienteResult.toString());
        System.out.println(direccionClienteResult.getDistrito().toString());

        //Test getAllDirecciones_Clientes
        List<DireccionCliente> direcciones = direccionClienteService.getAllDirecciones();
        for (DireccionCliente d : direcciones) {
            System.out.println(d.toString());
            System.out.println(d.getDetalles());
            System.out.println(d.getDistrito().toString());
        }

        return "index-new";
    }
    
}

