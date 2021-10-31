package Package.Controlador;
import Package.DAO.FiguraDao;
import Package.DAO.FiguraDaoImplem;
import Package.Modelo.Figura;

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



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("id"));
        int id = (int) session.getAttribute("id");

        FiguraDao figuraDao = new FiguraDaoImplem();
        List<Figura> mostrarFigurasUsuario = figuraDao.busquedaFiguraUsuario(id);


        for (Figura e : mostrarFigurasUsuario)
        {

            System.out.println("nombre:  " + e.getFiguraId());

        }
        req.setAttribute("listaFigura",mostrarFigurasUsuario);


        if(req.getParameter("idFigura") != null){
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
