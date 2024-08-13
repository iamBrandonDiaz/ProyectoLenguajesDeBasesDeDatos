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
        Provincia provincia = new Provincia();
        provincia.setIdProvincia(1L);
        Provincia provinciaResult = provinciaService.getProvincia(provincia);
        System.out.println(provinciaResult.toString());
        
        List<Provincia> provincias = provinciaService.getAllProvincias();
        for (Provincia p : provincias) {
            System.out.println(p.toString());
        }
        
        //Test getCanton and getAllCantones
        Canton canton = new Canton();
        canton.setIdCanton(1L);
        Canton cantonResult = cantonService.getCanton(canton);
        System.out.println(cantonResult.toString());

        List<Canton> cantones = cantonService.getAllCantones();
        for (Canton c : cantones) {
            System.out.println(c.toString());
        }

        // Test getDistrito and getAllDistritos
        Distrito distrito = new Distrito();
        distrito.setIdDistrito(16L);
        Distrito distritoResult = distritoService.getDistrito(distrito);
        System.out.println(distritoResult.toString());

        List<Distrito> distritos = distritoService.getAllDistritos();
        for (Distrito d : distritos) {
            System.out.println(d.toString());
        }

        //Test addDireccion_Clientes
        DireccionCliente direccionCliente = new DireccionCliente("Diagonal al super", distritoResult);
        Cliente cliente = new Cliente();
        cliente.setIdCliente(1L);
        System.out.println(direccionCliente.toString());
        direccionClienteService.insertDireccionCliente(direccionCliente, cliente, distritoResult);

        return "index-new";
    }
    
}

