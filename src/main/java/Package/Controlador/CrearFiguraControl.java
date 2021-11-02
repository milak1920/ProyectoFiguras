package Package.Controlador;





import Package.Service.RegistroFiguraServicio;



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
    RegistroFiguraServicio registroFigura = new RegistroFiguraServicio();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String borrar = req.getParameter("borrar");
        req.setAttribute("limpiar",borrar);


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
        Integer idUsuario = (Integer) session.getAttribute("id");
        System.out.println("IDUSUARIO: ");
        System.out.println(session.getAttribute("idUsuario"));

        //validar si el nombre existe y las coordinadas son numeros
        String nuevoNombreFigura = "";
        boolean prueba = registroFigura.valNombreFiguraRepetido(nombreFigura);
        boolean valGrandor = registroFigura.valNumero(grandor);
        boolean valcoordX = registroFigura.valNumero(coordX);
        boolean valcoordY = registroFigura.valNumero(coordY);
        //mostrar mensaje en caso de error
        if (prueba){
            req.setAttribute("errorNombreFigura", "El Nombre de figura existe!!");
        }else {
             nuevoNombreFigura = registroFigura.valNombreFigura(nombreFigura,tipoFigura);
             System.out.println(nuevoNombreFigura);
        }

        //validar coordenadas y tamaño
          if (!valGrandor){ //falso
              req.setAttribute("errorGrandor", "Ingrese un número!!!!");
          }
          if (!valcoordX){
            req.setAttribute("errorCoordX", "Ingrese un número!!!!");
          }
          if (!valcoordY){
            req.setAttribute("errorCoordY", "Ingrese un número!!!!");
          }

        //si esta bien guardar en bbdd
          if(!prueba && valGrandor && valcoordX && valcoordY){
              if(registroFigura.registroFigura(tipoFigura,nuevoNombreFigura,grandor,coordX,coordY,colorFondo,colorBorde,idUsuario)){
                  req.setAttribute("mensaje", " ¡¡Se registro correctamente!!");
              }
          }else {
              req.setAttribute("mensaje", " ¡¡no se registro!!");
          }


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/JSP/GuardarFigura.jsp");
        dispatcher.forward(req,resp);
    }
}
