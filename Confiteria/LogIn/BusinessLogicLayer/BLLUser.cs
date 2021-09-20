using DataAccessLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class BLLUser
    {
        public static bool InsertarUsuario(Usuario u)
        {
            return DALUser.InsertarUsuario(u);
        }

        public static List<Usuario> ValidarUsuario(string Usuario, string Contraseña)
        {
            return DALUser.ValidarUsuario(Usuario,Contraseña);
        }

        public static List<Usuario> CargarListaUsuarios(string tabla)
        {
            return DALUser.cargarListaUsuarios(tabla) ;
        }

        public static bool EliminarUsuario(Usuario u)
        {
            return DALUser.EliminarUsuario(u);
        }
    }
}
