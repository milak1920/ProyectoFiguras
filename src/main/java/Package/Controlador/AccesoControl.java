package Package.Controlador;

import Package.Service.RegistroUsuarioServicio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/AccesoUsuarios")
public class AccesoControl extends HttpServlet {
    RegistroUsuarioServicio registroUsuario = new RegistroUsuarioServicio();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/AccesoUsuario.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombreUsuario = req.getParameter("nombre");
        String password = req.getParameter("password");



        if (registroUsuario.usuarioAutorizado(nombreUsuario, password)){
            HttpSession session = req.getSession();
            session.setAttribute("auth", true);
            session.setAttribute("nombreUsuario", nombreUsuario);
            Integer idUsuario = registroUsuario.buscarId(nombreUsuario);
            session.setAttribute("id", idUsuario);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/GuardarFigura.jsp");
            dispatcher.forward(req, resp);
            return;
        }
        req.setAttribute("message", "Usuario no valido!!");


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/AccesoUsuario.jsp");
        dispatcher.forward(req, resp);
    }
}
