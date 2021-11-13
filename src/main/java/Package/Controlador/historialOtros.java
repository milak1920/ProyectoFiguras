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

@WebServlet(value = "/inside/historialOtros")
public class historialOtros extends HttpServlet {
    RegistroFiguraServicio registroFigura = new RegistroFiguraServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");

        FiguraDao figuraDao = new FiguraDaoImplem();
        List<Figura> mostrarFigurasOtros = figuraDao.busquedaFiguraOtros(id);


        req.setAttribute("listaFigura",mostrarFigurasOtros);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/OtrasFiguras.jsp");
        dispatcher.forward(req, resp);
    }
}
