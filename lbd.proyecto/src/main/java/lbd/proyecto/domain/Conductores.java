package lbd.proyecto.domain;

import java.util.List;

public class Conductores {
    private String nombre;
    private String licencia;
    private String telefono;

    public Conductores(String nombre, String licencia, String telefono) {
        this.nombre = nombre;
        this.licencia = licencia;
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLicencia() {
        return licencia;
    }

    public void setLicencia(String licencia) {
        this.licencia = licencia;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Chofer{" +
                "nombre='" + nombre + '\'' +
                ", licencia='" + licencia + '\'' +
                ", telefono='" + telefono + '\'' +
                '}';
    }


    public static void actualizarChofer(List<Conductores> choferes, String licencia, String nuevoNombre, String nuevoTelefono) {
        for (Conductores chofer : choferes) {
            if (chofer.getLicencia().equals(licencia)) {
                chofer.setNombre(nuevoNombre);
                chofer.setTelefono(nuevoTelefono);
                System.out.println("Chofer actualizado exitosamente.");
                return;
            }
        }
        System.out.println("Chofer con la licencia " + licencia + " no encontrado.");
    }}




