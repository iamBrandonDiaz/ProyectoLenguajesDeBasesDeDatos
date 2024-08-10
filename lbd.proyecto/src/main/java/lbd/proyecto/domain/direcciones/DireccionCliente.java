package lbd.proyecto.domain.direcciones;

// External imports
import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

// Internal imports
import lbd.proyecto.domain.direcciones.Direccion;
import lbd.proyecto.domain.Cliente;
import lbd.proyecto.domain.Pedido;

@Data
@Entity
@Table(name = "direccion_cliente")
public class DireccionCliente extends Direccion {

    //Serial version UID for Serializable classes
    private static final long serialVersionUID = 1L;

    //Attributes
    @Id // Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental value
    @Column(name = "id_direccion")
    private Long idDireccion; //Hibernate converts this to => id_direccion

    //Relationship with table Clientes
    @ManyToOne // Many addresses can belong to one client
    @JoinColumn(name = "id_cliente") // Foreign key
    private Cliente cliente; // Client to which the address belongs

    //Relationship with table Pedidos
    @OneToOne(mappedBy = "direccionCliente") // One address can belong to one order
    private Pedido pedido; // Order to which the address belongs

    //Constructors
    public DireccionCliente() {
    }

    public DireccionCliente(String detalles, Provincia provincia, Canton canton, Distrito distrito) {
        super(detalles, provincia, canton, distrito);
    }
    
}
