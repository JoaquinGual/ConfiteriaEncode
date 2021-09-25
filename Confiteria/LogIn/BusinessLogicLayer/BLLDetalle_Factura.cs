using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class BLLDetalle_Factura
    {
        public static bool InsertarDetalle(Detalle_Factura df)
        {
            return DALDetalle_Factura.InsertarDetalle(df);
        }
        public static bool EliminarDetalle(Detalle_Factura df)
        {
            return DALDetalle_Factura.EliminarDetalle(df);
        }
        public static List<Detalle_Factura> CargarListaDetalle(string tabla)
        {
            return DALDetalle_Factura.cargarListaDetalles(tabla);
        }
    }
}
