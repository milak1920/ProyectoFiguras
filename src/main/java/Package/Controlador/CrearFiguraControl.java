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


       // System.out.println( DBConnection.connection());

        //CREACION OBJETO FIGURA
       //   DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
       // Date date = new Date();
        //System.out.println(dateFormat.format(date));


        Figura nuevo = new Figura();
        nuevo.setTipoFigura(tipoFigura);
        nuevo.setNombreFigura(nombreFigura);
        nuevo.setGrandor(Integer.parseInt(grandor));
        nuevo.setCoordX(Integer.parseInt(coordX));
        nuevo.setCoordY(Integer.parseInt(coordY));
        nuevo.setColorFondo(colorFondo);
        nuevo.setColorBorde(colorBorde);

        FiguraDao figuraDao = new FiguraDaoImplem();
        figuraDao.insertar(nuevo);


        /*

           String nombre = req.getParameter("nombre");
          String apellido = req.getParameter("apellido");

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

         req.setAttribute("resultado",nombre + " " + apellido);

         */
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/GuardarFigura.jsp");
        dispatcher.forward(req,resp);
    }
}
