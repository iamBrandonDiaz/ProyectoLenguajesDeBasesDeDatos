/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lbd.proyecto.domain;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.io.Serializable;

public class Viajes implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Pedido")
    private Long ID_Cliente;
    private String fecha;
    private int monto;
    private int ID_Estado;

    public Viajes() {
    }

    public Viajes(Long ID_Cliente, String fecha, int monto, int ID_Estado) {
        this.ID_Cliente = ID_Cliente;
        this.fecha = fecha;
        this.monto = monto;
        this.ID_Estado = ID_Estado;
    }
    
    

}
