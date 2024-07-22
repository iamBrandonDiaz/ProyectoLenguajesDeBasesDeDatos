package lbd.proyecto.controller;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lbd.proyecto.dao.CamionDAO;
import lbd.proyecto.domain.Camion;

@WebServlet("/actualizarCamion")
public class CamionController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CamionDAO camionDAO;

    public void init() {
        camionDAO = new CamionDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String modelo = request.getParameter("modelo");
        String marca = request.getParameter("marca");
        int anio = Integer.parseInt(request.getParameter("anio"));

        Camion camion = new Camion(id, modelo, marca, anio);

        try {
            camionDAO.actualizarCamion(camion);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("listaCamiones.jsp");
    }
}
