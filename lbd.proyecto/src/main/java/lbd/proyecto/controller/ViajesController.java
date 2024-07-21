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

import lbd.proyecto.domain.Viajes;
import lbd.proyecto.service.ViajesService;

public class ViajesController {

    @Autowired
    ViajesService viajesService;

    @GetMapping("/listado")
    public String listado(Model model) {
        List<Viajes> lista = viajesService.getViajes(false);
        model.addAttribute("viajes", lista);
        model.addAttribute("totalviajes", lista.size());
        return "/viajes/listado";
    }

    @Controller
    @RequestMapping("/viajes")
    public class ViajeController {

        // Muestra la página principal
        @GetMapping("/agregar")
        public String page(Model model) {
            return "viaje/agregar";
        }

    }
}
