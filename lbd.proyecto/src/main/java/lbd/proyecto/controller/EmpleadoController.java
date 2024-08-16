package lbd.proyecto.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import jakarta.persistence.NoResultException;

// Internal imports
import lbd.proyecto.domain.Empleado;
import lbd.proyecto.domain.Licencia;
import lbd.proyecto.domain.LicenciaEmpleado;
import lbd.proyecto.domain.Puesto;
import lbd.proyecto.service.EmpleadoService;
import lbd.proyecto.service.PuestoService;
import lbd.proyecto.service.LicenciaService;
import lbd.proyecto.service.LicenciaEmpleadoService;

@Controller
@RequestMapping("/empleados")
public class EmpleadoController {
    
    @Autowired
    EmpleadoService empleadoService;

    @Autowired
    PuestoService puestoService;

    @Autowired
    LicenciaService licenciaService;

    @Autowired
    LicenciaEmpleadoService licenciaEmpleadoService;

    @GetMapping("/agregar")
    public String agregarEmpleado(Model model) { 
        model.addAttribute("puestos", puestoService.getAllPuestos());
        model.addAttribute("licencias", licenciaService.getAllLicencias());
        return "/empleado/agregar";
    }

    @PostMapping("/add")
    public String insertarCliente(@RequestParam String nombre, @RequestParam String apellido, @RequestParam String fechaNacimiento, 
        @RequestParam String idPuesto, @RequestParam String fechaContratacion, RedirectAttributes redirectAttributes) {
            Empleado empleado = new Empleado();
            empleado.setNombre(nombre);
            empleado.setApellido(apellido);
            empleado.setFechaNacimiento(empleado.convertDate(fechaNacimiento));
            empleado.setFechaContratacion(empleado.convertDate(fechaContratacion));
            Puesto puesto = new Puesto();
            puesto.setIdPuesto(idPuesto);
            empleado.setPuesto(puestoService.getPuesto(puesto));
            empleadoService.insertEmpleado(empleado);

            return "redirect:/empleados/ver";
    }
    
    @GetMapping("/editar/{idEmpleado}")
    public String editarEmpleado(@PathVariable Long idEmpleado, Model model) {
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(idEmpleado);
        Empleado empleadoResult = empleadoService.getEmpleado(empleado);
        model.addAttribute("empleado", empleadoResult);
        model.addAttribute("idEmpelado", idEmpleado);
        model.addAttribute("nombre", empleadoResult.getNombre());
        model.addAttribute("apellido", empleadoResult.getApellido());
        model.addAttribute("fechaNacimiento", empleadoResult.getFechaNacimiento());
        model.addAttribute("fechaContratacion", empleadoResult.getFechaContratacion());
        model.addAttribute("puestos", puestoService.getAllPuestos());

        return "/empleado/actualizar";
    }

    @PostMapping("/update")
    public String actualizarEmpleado(@RequestParam Long idEmpleado, @RequestParam String nombre, @RequestParam String apellido, @RequestParam String fechaNacimiento, @RequestParam String fechaContratacion, @RequestParam String idPuesto, RedirectAttributes redirectAttributes) {
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(idEmpleado);
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setFechaNacimiento(empleado.convertDate(fechaNacimiento));
        empleado.setFechaContratacion(empleado.convertDate(fechaContratacion));
        Puesto puesto = new Puesto();
        puesto.setIdPuesto(idPuesto);
        empleado.setPuesto(puestoService.getPuesto(puesto));
        empleadoService.updateEmpleado(idEmpleado, empleado);

        return "redirect:/empleados/ver";
    }

    @GetMapping("/ver")
    public String verEmpleados(Model model) {
        List<Empleado> empleados = empleadoService.getAllEmpleados();
        model.addAttribute("empleados", empleados);
        return "/empleado/ver";
    }

    @GetMapping("/eliminar/{idEmpleado}")
    public String eliminarEmpleado(@PathVariable Long idEmpleado, RedirectAttributes redirectAttributes) {
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(idEmpleado);
        empleadoService.deleteEmpleado(idEmpleado);
        return "redirect:/empleados/ver";
    }

    

}

