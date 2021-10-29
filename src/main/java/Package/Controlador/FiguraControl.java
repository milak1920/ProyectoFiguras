package Package.Controlador;

import Package.DAO.DBConnection;
import Package.DAO.UsuarioDao;
import Package.DAO.UsuarioDaoImplem;
import Package.Modelo.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/CrearFiguras")
public class FiguraControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/CrearFiguras.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

          String nombre = req.getParameter("nombre");
          String apellido = req.getParameter("apellido");
/*
         DBConnection.connection();
         System.out.println( DBConnection.connection());

         //creacion objecto usuario

        Usuario nuevo = new Usuario();
        nuevo.setUserName(nombre);
        nuevo.setPassword(apellido);
        System.out.println(nuevo);
        //mandar base de datos
        UsuarioDao usuarioDao = new UsuarioDaoImplem();
        usuarioDao.insert(nuevo);

        */
        req.setAttribute("resultado",nombre + " " + apellido);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/CrearFiguras.jsp");
        dispatcher.forward(req,resp);
    }
}
