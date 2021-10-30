package Package.Service;

import Package.DAO.UsuarioDao;
import Package.DAO.UsuarioDaoImplem;
import Package.Modelo.Usuario;

public class RegistroUsuarioServicio {
   UsuarioDao usuarioDao = new UsuarioDaoImplem();

   public boolean registroUsuario(String nombre,String password) {
       //validamos que el usuario no exista en la base de datos
        Usuario validar =  usuarioDao.buscarUsuario(nombre);
        if (validar != null){
            System.out.println("existe");
            return true;
        }else {
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setPassword(password);
            usuarioDao.agregar(usuario);
            System.out.println(" no existe");
            return false;
        }
    }

   public boolean usuarioAutorizado(String nombre, String password){

       Usuario validarAcceso =  usuarioDao.buscarUsuario(nombre);
        if (validarAcceso == null) return false;
       return password.equals(validarAcceso.getPassword());
   }

   public Integer buscarId(String nombre){
       Usuario validar =  usuarioDao.buscarUsuario(nombre);
       return validar.getUsuario_id();
   }

}
