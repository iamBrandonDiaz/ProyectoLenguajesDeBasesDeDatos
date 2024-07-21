package lbd.proyecto.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "conductores")

public class Conductores implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_empleado")
    private int idEmpleado;
    private int idLicencia;
    private String fechaExpedicion;
    private String fechaVencimiento;

    public Conductores() {
    }

    public Conductores(int idEmpleado, int idLicencia, String fechaExpedicion, String fechaVencimiento) {
        this.idEmpleado = idEmpleado;
        this.idLicencia = idLicencia;
        this.fechaExpedicion = fechaExpedicion;
        this.fechaVencimiento = fechaVencimiento;
    }


    

}
