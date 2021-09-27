using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DataAccessLayer;
using System.Data;
using System.Data.OleDb;

namespace BusinessLogicLayer
{
    public class BLLDetalle_Factura
    {
        public static bool InsertarDetalle(Detalle_Factura df)
        {
            return DALDetalle_Factura.InsertarDetalle(df);
        }
        public static OleDbDataReader detallePorId(int id)
        {
            return DALDetalle_Factura.detallePorId(id);
        }
        public static bool EliminarDetalle(Detalle_Factura df)
        {
            return DALDetalle_Factura.EliminarDetalle(df);
        }
        public static List<Detalle_Factura> CargarListaDetalle(string tabla)
        {
            return DALDetalle_Factura.cargarListaDetalles(tabla);
        }
        public static decimal calcularTotal(int id, bool flag)
        {
            return DALDetalle_Factura.calcularTotal(id,flag);
        }
    }
}
