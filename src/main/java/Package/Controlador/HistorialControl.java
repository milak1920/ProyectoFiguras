package Package.Controlador;
import Package.DAO.FiguraDao;
import Package.DAO.FiguraDaoImplem;
import Package.Modelo.Figura;
import Package.Service.RegistroFiguraServicio;
import Package.Service.RegistroUsuarioServicio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(value = "/historialFigura")
public class HistorialControl extends HttpServlet {

    RegistroFiguraServicio registroFigura = new RegistroFiguraServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("id"));
        int id = (int) session.getAttribute("id");

        FiguraDao figuraDao = new FiguraDaoImplem();
        List<Figura> mostrarFigurasUsuario = figuraDao.busquedaFiguraUsuario(id);


        req.setAttribute("listaFigura",mostrarFigurasUsuario);

        //uso de service falta lo de arriba
        if(req.getParameter("idFigura") != null){
            int idFigura = Integer.parseInt(req.getParameter("idFigura"));
            registroFigura.eliminarFigura(idFigura);
            System.out.println(idFigura);
            System.out.println("no es null");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/HistorialFigura.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/HistorialFigura.jsp");
        dispatcher.forward(req, resp);
    }
}
