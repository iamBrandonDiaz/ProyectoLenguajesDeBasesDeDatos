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

import lbd.proyecto.domain.Camiones;
import lbd.proyecto.service.CamionesService;


public class CamionesController {

    @Autowired
    CamionesService camionesService;
    
        @GetMapping("/listado")
    public String listado(Model model) {
        List<Camiones> lista = camionesService.getCamiones(false);
        model.addAttribute("camiones", lista);
        model.addAttribute("totalCamiones", lista.size());
        return "/camiones/listado";
    }

}
