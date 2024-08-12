package lbd.proyecto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lbd.proyecto.domain.direcciones.Provincia;
import lbd.proyecto.service.direcciones.ProvinciaService;

@Controller
public class IndexController {

    @Autowired
    ProvinciaService provinciaService;
    
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
        

        return "index-new";
    }
    
}

