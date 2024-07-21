package lbd.proyecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    
    // Muestra la página principal
    @RequestMapping("/")
    public String page(Model model) { 
        return "index-new";
    }
    
}

