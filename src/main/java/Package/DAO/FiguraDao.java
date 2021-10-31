package Package.DAO;

import Package.Modelo.Figura;
import Package.Modelo.Usuario;

import java.util.List;

public interface FiguraDao {
    void insertar (Figura figura);
    List<Figura> busquedaFiguraUsuario(int usarioID);

}
