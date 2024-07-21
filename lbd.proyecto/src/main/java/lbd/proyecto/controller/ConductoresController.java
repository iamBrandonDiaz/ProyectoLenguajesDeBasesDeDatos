
package lbd.proyecto.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import lbd.proyecto.domain.Conductores;
import lbd.proyecto.service.ConductoresService;


public class ConductoresController {
    
    @Autowired
    ConductoresService conductoresService;
    
        @GetMapping("/listado")
    public String listado(Model model) {
        List<Conductores> lista = conductoresService.getConductores(false);
        model.addAttribute("conductores", lista);
        model.addAttribute("totalConductores", lista.size());
        return "/conductores/listado";
    }
    
    
}
