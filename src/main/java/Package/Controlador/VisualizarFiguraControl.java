package Package.Controlador;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;

@WebServlet(value = "/visualizarFigura")
public class VisualizarFiguraControl extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nombreFigura = req.getParameter("nombreFigura");
        String tipoFigura = req.getParameter("tipoFigura");
        Integer grandor = Integer.valueOf(req.getParameter("grandor"));
        Integer coordX = Integer.valueOf(req.getParameter("coordX"));
        Integer coordY = Integer.valueOf(req.getParameter("coordY"));
        String colorFondo = req.getParameter("colorFondo");
        String colorBorde = req.getParameter("colorBorde");

        String nuevoColorFondo = "#" + colorFondo;
        String nuevoColorBorde = "#" + colorBorde;

 
        req.setAttribute("nombreFigura", nombreFigura);
        req.setAttribute("tipoFigura", tipoFigura);
        req.setAttribute("grandor", grandor);
        req.setAttribute("coordX", coordX);
        req.setAttribute("coordY", coordY);
        req.setAttribute("colorFondo", nuevoColorFondo);
        req.setAttribute("colorBorde", nuevoColorBorde);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/VisualizarFigura.jsp");
        dispatcher.forward(req, resp);
    }
}
