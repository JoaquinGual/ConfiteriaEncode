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
    public class DALArticulo
    {
        public static bool InsertarArticulo(Articulo a)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarArticulo";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@descripcion", a.pDescripcion);
                oDatos.Comando.Parameters.AddWithValue("@precio", a.pPrecio);
                oDatos.Comando.Parameters.AddWithValue("@idRubro", a.pIdRubro);
                oDatos.Comando.Parameters.AddWithValue("@activo", a.pActivo);
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

        public static bool BajaArticulos(Articulo a)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "bajaArticulos";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@id", a.pIdArticulo);

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



        public static Articulo CargarObjetoArticulo(OleDbDataReader lector)
        {

            Articulo a = new Articulo();



            if (!lector.IsDBNull(0))
            {
                a.pIdArticulo = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                a.pDescripcion = lector.GetString(1);
            }
            if (!lector.IsDBNull(2))
            {
                a.pPrecio = lector.GetDecimal(2);
            }
            if (!lector.IsDBNull(3))
            {
                a.pIdRubro = lector.GetInt32(3);
            }
            if (!lector.IsDBNull(4))
            {
                a.pActivo = lector.GetBoolean(4);
            }



            return a;
        }

        public static List<Articulo> cargarListaArticulos(string Tabla)
        {
            try
            {
                List<Articulo> LA = new List<Articulo>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LA.Clear();
                while (oDatos.Lector.Read())
                {

                    LA.Add(CargarObjetoArticulo(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LA;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }

        public static bool ActualizarArticulo(Articulo a)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "actualizarArticulo";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@idArticulo", a.pIdArticulo);
                oDatos.Comando.Parameters.AddWithValue("@descripcion", a.pDescripcion);
                oDatos.Comando.Parameters.AddWithValue("@precio", a.pPrecio);
                oDatos.Comando.Parameters.AddWithValue("@idRubro", a.pIdRubro);
                oDatos.Comando.Parameters.AddWithValue("@activo", a.pActivo);

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
    }
}
