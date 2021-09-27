using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Data.OleDb;
using System.Data;

namespace DataAccessLayer
{
    public class DALDetalle_Factura
    {
        public static decimal calcularTotal(int id,bool flag)
        {

            decimal total = 0;
            Datos oDatos = new Datos();
            try
            {


                string proc = "calcularTotal";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@id", id);

                oDatos.transaction = oDatos.conexion.BeginTransaction();
                oDatos.Comando.Transaction = oDatos.transaction;
                oDatos.Lector = oDatos.Comando.ExecuteReader();
                if (flag == false)
                {
                    if (oDatos.Lector.Read())
                    {
                        if (oDatos.Lector["Total"] != null)
                        {
                            total = (decimal)oDatos.Lector["Total"];
                        }

                    }
                }
                
                else
                {
                    total = 0;
                    flag = false;
                }

                    

                


                oDatos.CommitTransaction();
                return total;
            }
            catch (OleDbException e)
            {
                throw new Exception(e.Message);
                //oDatos.BeginTransaction();
                //return total;

            }
        }
        public static bool InsertarDetalle(Detalle_Factura df)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarDetalle";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@idFactura", df.pIdFactura);
                oDatos.Comando.Parameters.AddWithValue("@idArticulo", df.pIdArticulo);
                oDatos.Comando.Parameters.AddWithValue("@cantidad", df.pCantidad);
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
        public static OleDbDataReader detallePorId(int id)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "detallePorId";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@idFactura", id);
                oDatos.transaction = oDatos.conexion.BeginTransaction();
                oDatos.Comando.Transaction = oDatos.transaction;
                oDatos.Lector = oDatos.Comando.ExecuteReader();
                return oDatos.Lector;
                //oDatos.CommitTransaction();


            }
            catch (Exception)
            {
                oDatos.BeginTransaction();
                return oDatos.Lector;


            }
        }
        public static bool EliminarDetalle(Detalle_Factura df)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "eliminarDetalle";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@idDetalle", df.pIdDetalle);
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
        public static Detalle_Factura CargarObjetoDetalle(OleDbDataReader lector)
        {

            Detalle_Factura df = new Detalle_Factura();


            if (!lector.IsDBNull(0))
            {
                df.pIdDetalle = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                df.pIdFactura = lector.GetInt32(1);
            }
            if (!lector.IsDBNull(2))
            {
                df.pIdArticulo = lector.GetInt32(2);
            }
            if (!lector.IsDBNull(3))
            {
                df.pCantidad = lector.GetInt32(3);
            }
            return df;
        }

        public static List<Detalle_Factura> cargarListaDetalles(string Tabla)
        {
            try
            {
                List<Detalle_Factura> LDF = new List<Detalle_Factura>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LDF.Clear();
                while (oDatos.Lector.Read())
                {

                    LDF.Add(CargarObjetoDetalle(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LDF;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }
    }
}
