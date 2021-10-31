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


@WebServlet(value = "/home")
public class CrearFiguraControl extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {




        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/GuardarFigura.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tipoFigura = req.getParameter("tipoFigura");
        String nombreFigura = req.getParameter("nombreFigura");
        String grandor = req.getParameter("grandor");
        String coordX = req.getParameter("coordX");
        String coordY = req.getParameter("coordY");
        String colorFondo = req.getParameter("colorFondo");
        String colorBorde = req.getParameter("colorBorde");
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("id"));

        Figura nuevo = new Figura();
        nuevo.setTipoFigura(tipoFigura);
        nuevo.setNombreFigura(nombreFigura);

        nuevo.setGrandor(Integer.parseInt(grandor));
        nuevo.setCoordX(Integer.parseInt(coordX));
        nuevo.setCoordY(Integer.parseInt(coordY));
        nuevo.setColorFondo(colorFondo);
        nuevo.setColorBorde(colorBorde);
        nuevo.setUsuarioID((Integer) session.getAttribute("id"));


        FiguraDao figuraDao = new FiguraDaoImplem();
        figuraDao.insertar(nuevo);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/GuardarFigura.jsp");
        dispatcher.forward(req,resp);
    }
}
