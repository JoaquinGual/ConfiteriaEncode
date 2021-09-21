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
     public class DALMozo
    {
        public static bool InsertarMozo(Mozo m)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarMozo";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@Nombre", m.pNombre);
                oDatos.Comando.Parameters.AddWithValue("@Apellido", m.pApellido);
                oDatos.Comando.Parameters.AddWithValue("@Comision", m.pComision);
                oDatos.Comando.Parameters.AddWithValue("@idLocal", m.pIdLocal);
                oDatos.Comando.Parameters.AddWithValue("@Activo", m.pActivo);
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

        public static bool BajaMozos(Mozo m)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "bajaMozos";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@id", m.pIdMozo);

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



        public static Mozo CargarObjetoMozo(OleDbDataReader lector)
        {

            Mozo m = new Mozo();



            if (!lector.IsDBNull(0))
            {
                m.pIdMozo = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                m.pNombre = lector.GetString(1);
            }
            if (!lector.IsDBNull(2))
            {
                m.pApellido = lector.GetString(2);
            }
            if (!lector.IsDBNull(3))
            {
                m.pComision = lector.GetInt32(3);
            }
            if (!lector.IsDBNull(4))
            {
                m.pIdLocal = lector.GetInt32(4);
            }
            if (!lector.IsDBNull(5))
            {
                m.pActivo = lector.GetBoolean(5);
            }
            


            return m;
        }

        public static List<Mozo> cargarListaMozos(string Tabla)
        {
            try
            {
                List<Mozo> LM = new List<Mozo>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LM.Clear();
                while (oDatos.Lector.Read())
                {

                    LM.Add(CargarObjetoMozo(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LM;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }

      
    }
}
