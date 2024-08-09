package lbd.proyecto.domain;

// External imports
import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {
    
    //Serial version UID for Serializable classes
    private static final long serialVersionUID = 1L;

    //Attributes
    @Id // Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Autoincremental value
    @Column(name = "id_cliente")
    private Long idCliente; //Hibernate converts this to => id_cliente
    private String nombre; // Column => nombre
    private String apellido; // Column => apellido
    private String telefono; // Column => telefono
    private String email; // Column => email

    //Relationship with table Pedido
    @OneToMany(mappedBy = "cliente") // One client can have many orders
    private List<Pedido> pedidos; // List of orders

    //Relationship with table Direcciones_Cliente
    @OneToMany(mappedBy = "cliente") // One client can have many addresses
    

    

}
