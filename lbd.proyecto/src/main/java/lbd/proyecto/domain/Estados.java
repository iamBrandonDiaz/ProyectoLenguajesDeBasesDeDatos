package lbd.proyecto.domain;

// External imports
import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;


@Data
@Entity
@Table(name = "estados")
public class Estados implements Serializable {
    
    //Serial version UID for Serializable classes
    private static final long serialVersionUID = 1L;

    //Attributes
    @Id // Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental value
    @Column(name = "id_estado")
    private Long idEstado; //Hibernate converts this to => id_estado
    private String descripcion; //Column => descripcion

    //Relationship with table Pedidos
    @OneToMany(mappedBy = "estados") // One state can be assigned to many orders
    private List<Pedidos> pedidos; // List of orders

    //Relationship with table Facturas
    @OneToMany(mappedBy = "estados") // One state can be assigned to many invoices
    private List<Facturas> facturas; // List of invoices

    //Constructors
    public Estados() {
    }

    public Estados(String descripcion) {
        this.descripcion = descripcion;
    }

}
