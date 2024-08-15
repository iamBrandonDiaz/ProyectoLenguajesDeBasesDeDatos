package lbd.proyecto.controller;

import java.util.List;

import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lbd.proyecto.domain.Cliente;
import lbd.proyecto.domain.Empleado;
import lbd.proyecto.service.EmpleadoService;
import lbd.proyecto.domain.Estado;
import lbd.proyecto.service.EstadoService;
import lbd.proyecto.domain.direcciones.Canton;
import lbd.proyecto.domain.direcciones.DireccionCliente;
import lbd.proyecto.domain.direcciones.Distrito;
import lbd.proyecto.service.direcciones.CantonService;
import lbd.proyecto.service.direcciones.DireccionClienteService;
import lbd.proyecto.service.direcciones.DistritoService;
import lbd.proyecto.domain.direcciones.Provincia;
import lbd.proyecto.service.direcciones.ProvinciaService;
import lbd.proyecto.domain.Licencia;
import lbd.proyecto.domain.Puesto;
import lbd.proyecto.service.PuestoService;
import lbd.proyecto.service.LicenciaService;
import lbd.proyecto.domain.TipoCarga;
import lbd.proyecto.domain.Vehiculo;
import lbd.proyecto.service.VehiculoService;
import lbd.proyecto.service.TipoCargaService;

@Controller
public class IndexController {

    @Autowired
    EmpleadoService empleadoService;

    @Autowired
    PuestoService puestoService;

    @Autowired
    ProvinciaService provinciaService;

    @Autowired
    CantonService cantonService;

    @Autowired
    DistritoService distritoService;

    @Autowired
    DireccionClienteService direccionClienteService;

    @Autowired
    LicenciaService licenciaService;

    @Autowired
    EstadoService estadoService;

    @Autowired
    TipoCargaService tipoCargaService;

    @Autowired
    VehiculoService vehiculoService;

    

    // Muestra la página principal
    @RequestMapping("/")
    public String page(Model model) {
        //Test getProvincia and getAllProvincias
        // Provincia provincia = new Provincia();
        // provincia.setIdProvincia(3L);
        // Provincia provinciaResult = provinciaService.getProvincia(provincia);
        // System.out.println(provinciaResult.toString());
        
        // List<Provincia> provincias = provinciaService.getAllProvincias();
        // for (Provincia p : provincias) {
        //     System.out.println(p.toString());
        // }
        
        //Test getCanton and getAllCantones
        // Canton canton = new Canton();
        // canton.setIdCanton(1L);
        // Canton cantonResult = cantonService.getCanton(canton);
        // System.out.println(cantonResult.toString());

        // List<Canton> cantones = cantonService.getAllCantones();
        // for (Canton c : cantones) {
        //     System.out.println(c.toString());
        // }

        // Test getDistrito and getAllDistritos
        // System.out.println("NUEVO TEST");
        // Distrito distrito = new Distrito();
        // distrito.setIdDistrito(25L);
        // Distrito distritoResult = distritoService.getDistrito(distrito);
        // System.out.println(distritoResult.toString());

        // List<Distrito> distritos = distritoService.getAllDistritos();
        // for (Distrito d : distritos) {
        //     System.out.println(d.toString());
        // }

        //Test addDireccion_Clientes
        // DireccionCliente direccionCliente = new DireccionCliente("Nueva direccion para delete 2", distritoResult);
        // Cliente cliente = new Cliente();
        // cliente.setIdCliente(2L);
        // System.out.println(direccionCliente.toString());
        // direccionClienteService.insertDireccionCliente(direccionCliente, cliente, distritoResult);

        //Test updateDireccion_Clientes
        // DireccionCliente direccionCliente = new DireccionCliente();
        // direccionCliente.setIdDireccion(6L);
        // direccionCliente.setDetalles("Fix Direccion 2");

        // Distrito distrito2 = new Distrito();
        // distrito2.setIdDistrito(14L);
        // direccionCliente.setDistrito(distrito2);

        // System.out.println("TEST");
        // System.out.println(direccionCliente.toString());
        // System.out.println(direccionCliente.getDistrito().toString());
        // direccionClienteService.updateDireccionCliente(direccionCliente, direccionCliente.getDistrito());

        //Test getDireccion_Clientes
        // DireccionCliente direccionCliente = new DireccionCliente();
        // direccionCliente.setIdDireccion(1L);
        // DireccionCliente direccionClienteResult = direccionClienteService.getDireccionCliente(direccionCliente);
        // System.out.println(direccionClienteResult.toString());
        // System.out.println(direccionClienteResult.getDistrito().toString());

        //Test getAllDirecciones_Clientes
        // List<DireccionCliente> direcciones = direccionClienteService.getAllDirecciones();
        // for (DireccionCliente d : direcciones) {
        //     System.out.println(d.toString());
        //     System.out.println(d.getDetalles());
        //     System.out.println(d.getDistrito().toString());
        // }

        // Test searchDireccionByCliente
        // List<DireccionCliente> direcciones = direccionClienteService.searchDireccionesByCliente(2L);
        // for (DireccionCliente d : direcciones) {
        //     System.out.println("----- DIRECCION -----");
        //     System.out.println("ID Dirección: " + d.getIdDireccion());
        //     System.out.println("Detalles: " + d.getDetalles());
        //     System.out.println("ID Distrito: " + d.getDistrito().getIdDistrito() + " Nombre Distrito: " + d.getDistrito().getNombre());
        //     System.out.println("ID Canton: " + d.getDistrito().getCanton().getIdCanton() + " Nombre Canton: " + d.getDistrito().getCanton().getNombre());
        //     System.out.println("ID Provincia: " + d.getDistrito().getCanton().getProvincia().getIdProvincia() + " Nombre Provincia: " + d.getDistrito().getCanton().getProvincia().getNombre());
        //     System.out.println("ID Cliente: " + d.getCliente().getIdCliente());
        //     System.out.println("Nombre Cliente: " + d.getCliente().getNombre());
        //     System.out.println("Email Cliente: " + d.getCliente().getEmail());
        //     System.out.println("Telefono Cliente: " + d.getCliente().getTelefono());

        // }

        //Test deleteDireccion_Cliente
        // DireccionCliente direccionCliente = new DireccionCliente();
        // direccionCliente.setIdDireccion(21L);
        // direccionClienteService.deleteDireccionCliente(direccionCliente);


        //Test getLicencia and getAllLicencias
        // Licencia licencia = new Licencia();
        // licencia.setIdLicencia(1L);
        // Licencia licenciaResult = licenciaService.getLicencia(licencia);
        // System.out.println(licenciaResult.toString());

        // List<Licencia> licencias = licenciaService.getAllLicencias();
        // for (Licencia l : licencias) {
        //     System.out.println(l.toString());
        // }

        // Test getEstado and getAllEstados
        // Estado estado = new Estado();
        // estado.setIdEstado(3L);
        // Estado estadoResult = estadoService.getEstado(estado);
        // System.out.println(estadoResult.toString());

        // List<Estado> estados = estadoService.getAllEstados();
        // for (Estado e : estados) {
        //     System.out.println(e.toString());
        // }

        // Test getTipoCarga and getAllTipoCargas
        // TipoCarga tipoCarga = new TipoCarga();
        // tipoCarga.setIdTipo(1L);
        // TipoCarga tipoCargaResult = tipoCargaService.getTipoCarga(tipoCarga);
        // System.out.println(tipoCargaResult.toString());

        // List<TipoCarga> tiposCarga = tipoCargaService.getAllTiposCarga();
        // for (TipoCarga t : tiposCarga) {
        //     System.out.println(t.toString());
        // }

        // Test getPuesto and getAllPuestos
        // Puesto puesto = new Puesto();
        // puesto.setIdPuesto("MTN-TEC");
        // Puesto puestoResult = puestoService.getPuesto(puesto);
        // System.out.println(puestoResult.toString());

        // List<Puesto> puestos = puestoService.getAllPuestos();
        // for (Puesto p : puestos) {
        //     System.out.println(p.toString());
        // }

        // Test getVehiculo and getAllVehiculos
        // Vehiculo vehiculo = new Vehiculo();
        // vehiculo.setIdVehiculo(1L);
        // Vehiculo vehiculoResult = vehiculoService.getVehiculo(vehiculo);
        // System.out.println(vehiculoResult.toString());

        // List<Vehiculo> vehiculos = vehiculoService.getAllVehiculos();
        // for (Vehiculo v : vehiculos) {
        //     System.out.println(v.toString());
        // }

        // Test insertVehiculo
        // Vehiculo vehiculo = new Vehiculo("123-TST", "Toyota", "Corolla", 2015);
        // vehiculoService.insertVehiculo(vehiculo);

        // Test updateVehiculo
        // Vehiculo vehiculo = new Vehiculo();
        // vehiculo.setIdVehiculo(9L);
        // vehiculo.setMarca("Chevrolet");
        // vehiculo.setModelo("Concord");
        // vehiculo.setAnio(2010);
        // vehiculo.setPlaca("456-DEF");
        // vehiculoService.updateVehiculo(vehiculo.getIdVehiculo(), vehiculo);

        // Test deleteVehiculo
        // Vehiculo vehiculo = new Vehiculo();
        // vehiculo.setIdVehiculo(11L);
        // vehiculoService.deleteVehiculo(vehiculo.getIdVehiculo());

        // Test getEmpleado and getAllEmpleados
        // Empleado empleado = new Empleado();
        // empleado.setIdEmpleado(3L);
        // Empleado empleadoResult = empleadoService.getEmpleado(empleado);
        // System.out.println("*** EMPLEADO ***");
        // System.out.println("Nombre" + empleadoResult.getNombre());
        // System.out.println("Apellido" + empleadoResult.getApellido());
        // System.out.println("Fecha Nacimiento" + empleadoResult.getFechaNacimiento());
        // System.out.println("Fecha Contratacion" + empleadoResult.getFechaContratacion());
        // System.out.println("Puesto" + empleadoResult.getPuesto().toString());

        // System.out.println("*** LIST ***");
        // List<Empleado> empleados = empleadoService.getAllEmpleados();
        // for (Empleado e : empleados) {
        //     System.out.println(e.toString());
        //     System.out.println("*** ITEM ***");
        //     System.out.println("Nombre: " + e.getNombre());
        //     System.out.println("Apellido: " + e.getApellido());
        //     System.out.println("Fecha Nacimiento: " + e.getFechaNacimiento());
        //     System.out.println("Fecha Contratacion: " + e.getFechaContratacion());
        //     System.out.println("Puesto: " + e.getPuesto().toString());
        // }

        // Test insertEmpleado
        // Puesto puesto = new Puesto();
        // puesto.setIdPuesto("DRV-03");
        // Empleado empleado = new Empleado("Test 2", "Employee", empleadoService.convertDate("1950-12-24"), empleadoService.convertDate("1949-01-01"));
        // empleado.setPuesto(puesto);
        // empleadoService.insertEmpleado(empleado);

        // Test updateEmpleado
        // Empleado empleado = new Empleado();
        // empleado.setIdEmpleado(7L);
        // empleado.setNombre("Update");
        // empleado.setApellido("Test");
        // empleado.setFechaNacimiento(empleadoService.convertDate("1966-02-11"));
        // empleado.setFechaContratacion(empleadoService.convertDate("1965-01-01"));
        // Puesto puesto = new Puesto();
        // puesto.setIdPuesto("STR-MGR");
        // empleado.setPuesto(puesto);
        // empleadoService.updateEmpleado(empleado.getIdEmpleado(), empleado);

        // Test deleteEmpleado
        Empleado empleado = new Empleado();
        empleado.setIdEmpleado(8L);
        empleadoService.deleteEmpleado(empleado.getIdEmpleado());
        

        return "index-new";
    }
    
}

