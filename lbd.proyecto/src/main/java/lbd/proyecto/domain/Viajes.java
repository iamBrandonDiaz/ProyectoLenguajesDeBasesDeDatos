import java.util.ArrayList;
import java.util.List;

class Viaje {
    private int id;
    private String destino;
    private String fecha;
    private double precio;

    public Viaje(int id, String destino, String fecha, double precio) {
        this.id = id;
        this.destino = destino;
        this.fecha = fecha;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Viaje{" +
                "id=" + id +
                ", destino='" + destino + '\'' +
                ", fecha='" + fecha + '\'' +
                ", precio=" + precio +
                '}';
    }
}

public class Main {
    public static void main(String[] args) {
        List<Viaje> listaViajes = new ArrayList<>();
        listaViajes.add(new Viaje(1, "Paris", "2024-08-10", 1200.50));
        listaViajes.add(new Viaje(2, "Roma", "2024-09-15", 850.75));
        listaViajes.add(new Viaje(3, "Nueva York", "2024-10-20", 1500.00));

        System.out.println("Lista de viajes antes de la actualización:");
        for (Viaje v : listaViajes) {
            System.out.println(v);
        }

        actualizarViaje(listaViajes, 2, "Roma", "2024-09-20", 900.00);

        System.out.println("\nLista de viajes después de la actualización:");
        for (Viaje v : listaViajes) {
            System.out.println(v);
        }
    }

    public static void actualizarViaje(List<Viaje> listaViajes, int id, String nuevoDestino, String nuevaFecha, double nuevoPrecio) {
        for (Viaje viaje : listaViajes) {
            if (viaje.getId() == id) {
                viaje.setDestino(nuevoDestino);
                viaje.setFecha(nuevaFecha);
                viaje.setPrecio(nuevoPrecio);
                System.out.println("Viaje actualizado: " + viaje);
                return;
            }
        }
        System.out.println("Viaje con id " + id + " no encontrado.");
    }
}
