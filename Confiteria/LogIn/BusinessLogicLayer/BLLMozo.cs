using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;
namespace BusinessLogicLayer
{
    public class BLLMozo
    {
        public static bool InsertarMozo(Mozo m)
        {
            return DALMozo.InsertarMozo(m);
        }

      

        public static List<Mozo> CargarListaMozo(string tabla)
        {
            return DALMozo.cargarListaMozos(tabla);
        }

        public static bool bajaMozos(Mozo m)
        {
            return DALMozo.BajaMozos(m);
        }
    }
}
