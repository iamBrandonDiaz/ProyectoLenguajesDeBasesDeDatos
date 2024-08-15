package lbd.proyecto.dao;

// External imports
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

// Internal imports
import lbd.proyecto.domain.LicenciaEmpleado;

public interface LicenciaEmpleadoDAO extends JpaRepository<LicenciaEmpleado, Long> {

    // Method to call an stored procedure to insert a new license for an employee
    @Procedure(procedureName = "insertar_licencia_empleado")
    void insertLicenciaEmpleado(Long idEmpleado, Long idLicencia, Date fechaInicio, Date fechaFin);

    // Method to call an stored procedure to update a license for an employee
    @Procedure(procedureName = "actualizar_licencia_empleado")
    void updateLicenciaEmpleado(Long idLicenciaEmpleado, Long idLicencia, Date fechaInicio, Date fechaFin);

    // Method to call an stored procedure to delete a license for an employee
    @Procedure(procedureName = "eliminar_licencia_empleado")
    void deleteLicenciaEmpleado(Long idLicencia);

    // Method to call an stored procedure to get a (single) license for an employee
    @Procedure(procedureName = "ver_licencia_empleado")
    LicenciaEmpleado getLicenciaEmpleado(Long idLicencia);

    // Method to call an stored procedure to get all licenses for employees
    @Procedure(procedureName = "ver_licencias_empleados")
    List<LicenciaEmpleado> getAllLicenciasEmpleado();
    
}
