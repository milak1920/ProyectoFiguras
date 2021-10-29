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

        if(registroUsuario.RegistroUsuario(nombre,password)){
            //true existe
            req.setAttribute("mensaje", " ¡¡El usuario ya existe!!");
        }




        /*
        Usuario nuevo = new Usuario();
        nuevo.setNombre(nombre);
        nuevo.setPassword(password);
        System.out.println(nuevo);
        //mandar base de datos
        UsuarioDao usuarioDao = new UsuarioDaoImplem();
       // usuarioDao.agregar(nuevo);
        Usuario validar =  usuarioDao.buscarUsuario(nombre);

        if (validar != null){ //no existe
            System.out.println("existe");
            System.out.println(validar);
        }else {
            System.out.println(" no existe");
        }*/

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/RegistroUsuario.jsp");
        dispatcher.forward(req,resp);
    }
}
