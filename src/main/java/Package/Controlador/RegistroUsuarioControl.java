package Package.Controlador;

import Package.Service.RegistroUsuarioServicio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(value = "/registroUsuario")
public class RegistroUsuarioControl extends HttpServlet {
    RegistroUsuarioServicio registroUsuario = new RegistroUsuarioServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/RegistroUsuario.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String password = req.getParameter("password");

        if(registroUsuario.registroUsuario(nombre,password)){
            //true existe
            req.setAttribute("error", " ¡¡El usuario ya existe!!");
        }else {
            req.setAttribute("crear", " ¡¡Se ha registrado correctamente!!");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/RegistroUsuario.jsp");
        dispatcher.forward(req,resp);
    }
}
