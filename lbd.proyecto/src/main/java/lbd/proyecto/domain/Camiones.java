package lbd.proyecto.domain;

import lombok.Data;
import jakarta.persistence.*;
import java.io.Serializable;


@Data
@Entity
@Table(name = "camiones")

public class Camiones implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name = "id_vehiculo")
    private Long idVehiculo; 
    private String marca; 
    private String modelo;  
    private int anio; 
    private String rutaImagen; 
    private String placa; 

    public Camiones() {
    }

    public Camiones(Long idVehiculo, String marca, String modelo, int anio, String rutaImagen, String placa) {
        this.idVehiculo = idVehiculo;
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
        this.rutaImagen = rutaImagen;
        this.placa = placa;
    }
    
    
    
}
