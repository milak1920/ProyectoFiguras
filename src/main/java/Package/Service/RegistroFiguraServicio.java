package Package.Service;

import Package.DAO.FiguraDao;
import Package.DAO.FiguraDaoImplem;
import Package.Modelo.Figura;
import Package.Modelo.Usuario;

public class RegistroFiguraServicio {

    FiguraDao figuraDao = new FiguraDaoImplem();

    public boolean eliminarFigura(int idfigura){
        FiguraDao figuraDao = new FiguraDaoImplem();
        figuraDao.borrarFigura(idfigura);
        return true;
    }

    public boolean registroFigura(String tipoFigura,String nombreFigura, String grandor,String coordX, String coordY, String colorFondo, String colorBorde, Integer usuarioID) {

        String nuevoColorFondo = colorFondo.replace("#", "");
        String nuevoColorBorde = colorBorde.replace("#", "");

        Figura nuevo = new Figura();
        nuevo.setTipoFigura(tipoFigura);
        nuevo.setNombreFigura(nombreFigura);
        nuevo.setGrandor(Integer.parseInt(grandor));
        nuevo.setCoordX(Integer.parseInt(coordX));
        nuevo.setCoordY(Integer.parseInt(coordY));
        nuevo.setColorFondo(nuevoColorFondo);
        nuevo.setColorBorde(nuevoColorBorde);
        nuevo.setUsuarioID(usuarioID);
        figuraDao.insertar(nuevo);
        return true;
    }



    //validar valores de figura
    public boolean valNombreFiguraRepetido(String nombreFigura){
        Figura validar = figuraDao.buscarNombreFigura(nombreFigura);
        if(validar == null) return false;
        return true;
    }
    public String valNombreFigura(String nombreFigura, String tipoFigura){
        System.out.println("dentro de  valNombreFigura");
        System.out.println(nombreFigura);
         if(nombreFigura.isEmpty() || nombreFigura == null){
             int numeroAleatorio = (int) (Math.random()*500+1);
             nombreFigura = tipoFigura + "_" + numeroAleatorio;
             return nombreFigura;
         }else {
             return nombreFigura;
         }
    }
    public boolean valNumero(String valor){
        boolean numeroValido =  valor.matches("[+-]?\\d*(\\.\\d+)?");
        return numeroValido;
    }

}
