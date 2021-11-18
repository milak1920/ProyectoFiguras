package Package.Controlador;

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
        //En el controlador no debe esta el DAO esto se debe de implementar en Servicio
        //obtener nombre y id por session
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        String nombre = (String) session.getAttribute("nombreUsuario");


        //Visualizar lista de usuario unico
        List<Figura> mostrarFigurasUsuario = registroFigura.buscarFiguraUsuario(id);
        req.setAttribute("listaFigura",mostrarFigurasUsuario);
        req.setAttribute("nombre",nombre);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/HistorialFigura.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");


        String idFiguraBorrar = req.getParameter("figuraBorrar");

        //session id
        String idSessionUsuario = String.valueOf(session.getAttribute("id"));
        String idUsuarioServer = req.getParameter("usuarioID");
         //fin

        //borrar del historial
        if(idFiguraBorrar != null && idSessionUsuario.equals(idUsuarioServer)){
            System.out.println("se borro correctamente con id de usuario " + idUsuarioServer + "session id " + idSessionUsuario);
            int idFigura = Integer.parseInt(idFiguraBorrar);
           registroFigura.eliminarFigura(idFigura);
        }
        System.out.println("ahora visualizar denuevo historial ok");

        List<Figura> mostrarFigurasUsuario = registroFigura.buscarFiguraUsuario(id);
        req.setAttribute("listaFigura",mostrarFigurasUsuario);





        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/HistorialFigura.jsp");
        dispatcher.forward(req, resp);
    }
}
