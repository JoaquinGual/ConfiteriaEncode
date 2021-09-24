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
    public class DALRubro
    {
        public static Rubro CargarObjetoRubro(OleDbDataReader lector)
        {

            Rubro r = new Rubro();



            if (!lector.IsDBNull(0))
            {
                r.pIdRubro = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                r.pNombreRubro = lector.GetString(1);
            }
            if (!lector.IsDBNull(2))
            {
                r.pActivo = lector.GetBoolean(2);
            }



            return r;
        }
        public static List<Rubro> cargarListaRubros(string Tabla)
        {
            try
            {
                List<Rubro> LR = new List<Rubro>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LR.Clear();
                while (oDatos.Lector.Read())
                {

                    LR.Add(CargarObjetoRubro(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LR;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }
        public static bool InsertarRubro(Rubro r)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarRubro";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@nombreRubro", r.pNombreRubro);
                oDatos.Comando.Parameters.AddWithValue("@activo", r.pActivo);
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

        public static bool BajaRubro(Rubro r)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "bajaRubro";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@id", r.pIdRubro);

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

        public static bool ActualizarRubro(Rubro r)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "actualizarRubro";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@idRubro", r.pIdRubro);
                oDatos.Comando.Parameters.AddWithValue("@nombreRubro", r.pNombreRubro);
                oDatos.Comando.Parameters.AddWithValue("@activo", r.pActivo);


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
