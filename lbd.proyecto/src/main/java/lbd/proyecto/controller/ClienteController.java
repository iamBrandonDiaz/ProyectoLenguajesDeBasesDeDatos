package lbd.proyecto.controller;

import java.util.ArrayList;
// External imports
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Empty;

import jakarta.persistence.NoResultException;
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

    // Update
    // @GetMapping("/update-test")
    // public String updateClientTest() {
    //     Cliente clienteTest = new Cliente("New Name", "New Lastname", "00000000", "new@email.com");
    //     clienteService.updateCliente(1L, clienteTest);
    //     return "redirect:/clientes";
    // }

    @GetMapping("/editar/{idCliente}")
    public String editarCliente(@PathVariable Long idCliente, Model model) {
        Cliente cliente = new Cliente();
        cliente.setIdCliente(idCliente);
        Cliente clienteResult = clienteService.getCliente(cliente);
        model.addAttribute("cliente", clienteResult);
        model.addAttribute("idCliente", idCliente);
        model.addAttribute("nombre", clienteResult.getNombre());
        model.addAttribute("apellido", clienteResult.getApellido());
        model.addAttribute("telefono", clienteResult.getTelefono());
        model.addAttribute("email", clienteResult.getEmail());
        return "/cliente/actualizar";
    }

    @PostMapping("/update")
    public String actualizarCliente(@RequestParam Long idCliente, @RequestParam String nombre, @RequestParam String apellido, @RequestParam String telefono, @RequestParam String email) {
        Cliente cliente = new Cliente();
        cliente.setIdCliente(idCliente);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setTelefono(telefono);
        cliente.setEmail(email);
        clienteService.updateCliente(idCliente, cliente);
        return "redirect:/clientes/ver";
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

    // Delete
    @GetMapping("/delete-test")
    public String deleteClienteTest() {
        clienteService.deleteCliente(3L);
        return "redirect:/clientes";
    }

    @GetMapping("/eliminar/{idCliente}")
    public String eliminarCliente(@PathVariable Long idCliente) {
        clienteService.deleteCliente(idCliente);
        return "redirect:/clientes/ver";

    }

    // Searches
    // @GetMapping("/search-test")
    // public String searchClientesTest() {
    //     List<Cliente> clientes = clienteService.searchClientes("Name");
    //     System.out.println(clientes);
    //     return "redirect:/clientes";
    // }

    @PostMapping("/busqueda-nombre")
    public String buscarClienteNombre(@RequestParam String nombreBusqueda, Model model) {
        List<Cliente> clientes = clienteService.searchClientesNombre(nombreBusqueda);
        model.addAttribute("nombreBusqueda", nombreBusqueda);
        model.addAttribute("clientes", clientes);
        return "/cliente/ver";
    }

    @PostMapping("/busqueda-email")
    public String buscarClienteEmail(@RequestParam String emailBusqueda, Model model) {
        List<Cliente> clientes = clienteService.searchClientesEmail(emailBusqueda);
        model.addAttribute("emailBusqueda", emailBusqueda);
        model.addAttribute("clientes", clientes);
        return "/cliente/ver";
    }

    @PostMapping("/busqueda-id")
    public String buscarClienteId(@RequestParam Long idBusqueda, Model model) {
        Cliente cliente = new Cliente();
        cliente.setIdCliente(idBusqueda);

        Cliente clienteResult = clienteService.getCliente(cliente);
        List<Cliente> clientes = new ArrayList<>();

        if (clienteResult != null) {
            clientes.add(clienteResult);
        }

        model.addAttribute("clientes", clientes);

        // try {
        //     clienteResult = clienteService.getCliente(cliente);
        //     List<Cliente> clientes = new ArrayList<>();
        //     clientes.add(clienteResult);
        //     model.addAttribute("clientes", clientes);
        // } catch ( DataAccessException e) {
        //     List<Cliente> clientes = new ArrayList<>();
        //     model.addAttribute("clientes", clientes);
            
        // }

        model.addAttribute("idBusqueda", idBusqueda);
        return "/cliente/ver";
    }
}
