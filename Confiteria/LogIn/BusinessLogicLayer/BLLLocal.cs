using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public class BLLLocal
    {
        public static List<Local> CargarListaLocales(string tabla)
        {
            return DALLocal.cargarListaLocales(tabla);
        }
    }
}
