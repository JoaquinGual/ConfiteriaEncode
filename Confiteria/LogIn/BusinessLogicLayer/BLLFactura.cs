using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLLFactura
    {
        public static bool InsertarFactura(Factura f)
        {
            return DALFactura.InsertarFactura(f);
        }

        public static List<Factura> CargarListaFactura(string tabla)
        {
            return DALFactura.cargarListaFacturas(tabla);
        }
        public static int traerNumeroFactura()
        {
            return DALFactura.traerNumeroFactura();
        }

    }
}
