using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public class BLLArticulo
    {
        public static bool InsertarArticulo(Articulo a)
        {
            return DALArticulo.InsertarArticulo(a);
        }
        public static bool ActualizarArticulo(Articulo a)
        {
            return DALArticulo.ActualizarArticulo(a);
        }



        public static List<Articulo> CargarListaArticulo(string tabla)
        {
            return DALArticulo.cargarListaArticulos(tabla);
        }

        public static bool bajaArticulos(Articulo a)
        {
            return DALArticulo.BajaArticulos(a);
        }
    }
}
