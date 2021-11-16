package Package.Controlador;

import Package.Modelo.Figura;
import Package.Service.RegistroFiguraServicio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/inside/visualizarFigura")
public class VisualizarFiguraControl extends HttpServlet {

    RegistroFiguraServicio registroFigura = new RegistroFiguraServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/VisualizarFigura.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("click visualizar");
        String idFiguraVer = req.getParameter("figuraVer");
        System.out.println(idFiguraVer);
        //Visualizar lista de usuario unico
        int idFigura = Integer.parseInt(idFiguraVer);
        List<Figura> verFigurasUsuario = registroFigura.obtenerFiguraUnicaVer(idFigura);
        req.setAttribute("listaFiguraVer",verFigurasUsuario);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/VisualizarFigura.jsp");
        dispatcher.forward(req, resp);
    }
}
