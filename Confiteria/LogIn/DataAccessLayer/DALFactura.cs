using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Data;
using System.Data.OleDb;

namespace DataAccessLayer
{
    public class DALFactura
    {
        public static bool InsertarFactura(Factura f)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarFactura";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@fechaEmision", f.pFechaEmision);
                oDatos.Comando.Parameters.AddWithValue("@idMozo", f.pIdMozo);
                oDatos.transaction = oDatos.conexion.BeginTransaction();
                oDatos.Comando.Transaction = oDatos.transaction;
                oDatos.Comando.ExecuteNonQuery();

                oDatos.CommitTransaction();
                return true;
            }
            catch (Exception)
            {
                oDatos.BeginTransaction();
                return false;

            }

        }
        public static Factura CargarObjetoFactura(OleDbDataReader lector)
        {

            Factura f = new Factura();



            if (!lector.IsDBNull(0))
            {
                f.pIdFactura = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                f.pFechaEmision = lector.GetDateTime(1);
            }
            if (!lector.IsDBNull(2))
            {
                f.pIdMozo = lector.GetInt32(2);
            }
            return f;
        }

        public static List<Factura> cargarListaFacturas(string Tabla)
        {
            try
            {
                List<Factura> LF = new List<Factura>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LF.Clear();
                while (oDatos.Lector.Read())
                {

                    LF.Add(CargarObjetoFactura(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LF;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }
    }
}
