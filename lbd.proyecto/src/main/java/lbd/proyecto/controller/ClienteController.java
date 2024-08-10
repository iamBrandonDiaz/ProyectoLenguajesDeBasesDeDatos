package lbd.proyecto.controller;

// External imports
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// Internal imports
import lbd.proyecto.domain.Cliente;
import lbd.proyecto.service.ClienteService;

@Controller
@RequestMapping("/clientes")
public class ClienteController {
    
    @Autowired
    ClienteService clienteService;

    @GetMapping("/add-test")
    public String addClientTest() {
        Cliente clienteTest = new Cliente("Name", "Lastname", "123456789", "name@last.com");
        clienteService.insertCliente(clienteTest);
        return "redirect:/clientes";
    }

    @GetMapping("/update-test")
    public String updateClientTest() {
        Cliente clienteTest = new Cliente("New Name", "New Lastname", "00000000", "new@email.com");
        clienteService.updateCliente(1L, clienteTest);
        return "redirect:/clientes";
    }

    @GetMapping("/get-test")
    public String getClienteTest() {
        Cliente cliente = new Cliente();
        cliente.setIdCliente(1L);

        Cliente clienteTest = clienteService.getCliente(cliente);

        System.out.println(clienteTest);
        return "redirect:/clientes";
    }
}
