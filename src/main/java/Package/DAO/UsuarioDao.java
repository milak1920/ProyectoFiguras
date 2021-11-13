package Package.DAO;

import Package.Modelo.Usuario;

public interface UsuarioDao {
    void agregar (Usuario usuario);

    Usuario buscarUsuario(String nombre);

}
