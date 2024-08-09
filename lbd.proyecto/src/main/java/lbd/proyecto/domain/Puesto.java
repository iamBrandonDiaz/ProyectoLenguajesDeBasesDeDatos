package lbd.proyecto.domain;

// External imports
import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "puestos")
public class Puesto implements Serializable {
    
    //Serial version UID for Serializable classes
    private static final long serialVersionUID = 1L;
    
    //Attributes
    @Id // Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental value
    @Column(name = "id_puesto")
    private Long idPuesto; //Hibernate converts this to => id_puesto
    private double salario; // Column => salario
    private String descripcion; // Column => descripcion

    //Relationship with table Empleado
    @OneToMany(mappedBy = "puestos") // One job can have many employees
    @JoinColumn(name = "id_puesto", insertable = false, updatable = false) // Foreign key, not insertable or updatable
    private List<Empleado> empleados; // List of employees

    //Constructors
    public Puesto() {
    }

    public Puesto(double salario, String descripcion) {
        this.salario = salario;
        this.descripcion = descripcion;
    }

}
