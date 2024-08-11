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

    // Add
    // @GetMapping("/add-test")
    // public String addClientTest() {
    //     Cliente clienteTest = new Cliente("Alejandraias", "Lastname3", "3333333", "name3@last3.com");
    //     clienteService.insertCliente(clienteTest);
    //     return "redirect:/clientes";
    // }

    @GetMapping("/agregar")
    public String agregarCliente() {
        return "/cliente/agregar";
    }

    @PostMapping("/add")
    public String insertarCliente(@RequestParam String nombre, @RequestParam String apellido, @RequestParam String telefono, @RequestParam String email) {
        Cliente cliente = new Cliente(nombre, apellido, telefono, email);
        System.out.println(cliente);
        clienteService.insertCliente(cliente);
        return "redirect:/clientes/ver";
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
        cliente.setIdCliente(2L);
        

        Cliente clienteTest = clienteService.getCliente(cliente);

        System.out.println(cliente.getIdCliente());
        System.out.println(clienteTest);
        return "redirect:/clientes";
    }

    // Get All
    // @GetMapping("/all-test")
    // public String getAllClientesTest() {
    //     List<Cliente> clientes = clienteService.getAllClientes();
    //     System.out.println(clientes);
    //     return "redirect:/clientes";
    // }

    @GetMapping("/ver")
    public String verClientes(Model model) {
        List<Cliente> clientes = clienteService.getAllClientes();
        model.addAttribute("clientes", clientes);
        return "/cliente/ver";
    }

    @GetMapping("/delete-test")
    public String deleteClienteTest() {
        clienteService.deleteCliente(3L);
        return "redirect:/clientes";
    }

    // Search by name
    // @GetMapping("/search-test")
    // public String searchClientesTest() {
    //     List<Cliente> clientes = clienteService.searchClientes("Name");
    //     System.out.println(clientes);
    //     return "redirect:/clientes";
    // }

    @PostMapping("/busqueda-nombre")
    public String buscarClienteNombre(@RequestParam String nombreBusqueda, Model model) {
        List<Cliente> clientes = clienteService.searchClientes(nombreBusqueda);
        model.addAttribute("nombreBusqueda", nombreBusqueda);
        model.addAttribute("clientes", clientes);
        return "/cliente/ver";
    }
}
