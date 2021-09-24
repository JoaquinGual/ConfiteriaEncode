using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLLRubro
    {
        public static List<Rubro> CargarListaRubros(string tabla)
        {
            return DALRubro.cargarListaRubros(tabla);
        }
        public static bool InsertarRubro(Rubro r)
        {
            return DALRubro.InsertarRubro(r);
        }
        public static bool ActualizarRubro(Rubro r)
        {
            return DALRubro.ActualizarRubro(r);
        }

        public static bool bajaRubros(Rubro r)
        {
            return DALRubro.BajaRubro(r);
        }
    }
}
