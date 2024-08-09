package lbd.proyecto.domain;

// External imports
import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "licencias")
public class Licencia implements Serializable {

    //Serial version UID for Serializable classes
    private static final long serialVersionUID = 1L;

    //Attributes
    @Id // Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental value
    @Column(name = "id_licencia")
    private Long idLicencia; //Hibernate converts this to => id_licencia
    private String tipo; // Column => tipo

    //Relationship with table Empleado
    @OneToMany(mappedBy = "licencias") // One license can have many employees
    @JoinColumn(name = "id_licencia", insertable = false, updatable = false) // Foreign key, not insertable or updatable
    private List<Empleado> empleados; // List of employees

    //Constructors
    public Licencia() {
    }

    public Licencia(String tipo) {
        this.tipo = tipo;
    }
    
}
