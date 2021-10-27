package Package.Controlador;

import Package.DAO.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/CrearFi")
public class FiguraControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/CrearFiguras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //req.setAttribute("Aleatoris",aleat);


        DBConnection.connection();
        System.out.println( DBConnection.connection());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/CrearFiguras.jsp");
        dispatcher.forward(req,resp);
    }
}
