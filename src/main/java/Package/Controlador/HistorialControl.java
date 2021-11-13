package Package.Controlador;
import Package.DAO.FiguraDao;
import Package.DAO.FiguraDaoImplem;
import Package.Modelo.Figura;
import Package.Service.RegistroFiguraServicio;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(value = "/inside/historialFigura")
public class HistorialControl extends HttpServlet {

    RegistroFiguraServicio registroFigura = new RegistroFiguraServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        String nombre = (String) session.getAttribute("nombreUsuario");

        FiguraDao figuraDao = new FiguraDaoImplem();
        List<Figura> mostrarFigurasUsuario = figuraDao.busquedaFiguraUsuario(id);


        req.setAttribute("listaFigura",mostrarFigurasUsuario);
        req.setAttribute("nombre",nombre);

        if(req.getParameter("idFigura") != null){
            int idFigura = Integer.parseInt(req.getParameter("idFigura"));
            registroFigura.eliminarFigura(idFigura);
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
