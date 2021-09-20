using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DALUser
    {
        public static bool InsertarUsuario(Usuario u)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "agregarUsuario";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@Nombre", u.pNombre);
                oDatos.Comando.Parameters.AddWithValue("@Apellido", u.pApellido);
                oDatos.Comando.Parameters.AddWithValue("@TipoDocumento", u.pTipoDocumento);
                oDatos.Comando.Parameters.AddWithValue("@NumeroDocumento", u.pNumeroDocumento);
                oDatos.Comando.Parameters.AddWithValue("@Email", u.pEmail);
                oDatos.Comando.Parameters.AddWithValue("@User", u.pNombreUsuario);
                oDatos.Comando.Parameters.AddWithValue("@Pass", u.pPassword);
                oDatos.Comando.Parameters.AddWithValue("@TipoUser", u.pTipoUser);
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

        public static bool EliminarUsuario(Usuario u)
        {
            Datos oDatos = new Datos();
            try
            {


                string proc = "eliminarUsuarios";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@id", u.pId);

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



        public static Usuario CargarObjetoUsuario(OleDbDataReader lector)
        {

            Usuario u = new Usuario();



            if (!lector.IsDBNull(0))
            {
                u.pId = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                u.pNombre = lector.GetString(1);
            }
            if (!lector.IsDBNull(2))
            {
                u.pApellido = lector.GetString(2);
            }
            if (!lector.IsDBNull(3))
            {
                u.pTipoDocumento = lector.GetString(3);
            }
            if (!lector.IsDBNull(4))
            {
                u.pNumeroDocumento = lector.GetString(4);
            }
            if (!lector.IsDBNull(5))
            {
                u.pEmail = lector.GetString(5);
            }
            if (!lector.IsDBNull(6))
            {
                u.pNombreUsuario = lector.GetString(6);
            }
            if (!lector.IsDBNull(7))
            {
                u.pPassword = lector.GetString(7);
            }
            if (!lector.IsDBNull(8))
            {
                u.pTipoUser = lector.GetBoolean(8);
            }


            return u;
        }

        public static List<Usuario> cargarListaUsuarios(string Tabla)
        {
            try
            {
                List<Usuario> LS = new List<Usuario>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LS.Clear();
                while (oDatos.Lector.Read())
                {

                    LS.Add(CargarObjetoUsuario(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LS;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }

        public static List<Usuario> ValidarUsuario(string Usuario, string Contraseña)
        {
            Datos oDatos = new Datos();
            List<Usuario> LU = new List<Usuario>();

            try
            {


                string proc = "validarUsuario";
                oDatos.Conectar();
                oDatos.Comando.CommandType = CommandType.StoredProcedure;
                oDatos.Comando.CommandText = proc;
                oDatos.Comando.Parameters.Clear();
                oDatos.Comando.Parameters.AddWithValue("@User", Usuario);
                oDatos.Comando.Parameters.AddWithValue("@Pass", Contraseña);
                oDatos.transaction = oDatos.conexion.BeginTransaction();
                oDatos.Comando.Transaction = oDatos.transaction;
                oDatos.Lector = oDatos.Comando.ExecuteReader();

                while (oDatos.Lector.Read())
                {

                    LU.Add(CargarObjetoUsuario(oDatos.Lector));
                }
                


                oDatos.CommitTransaction();
                return LU;



            }
            catch (Exception)
            {
                oDatos.BeginTransaction();
                return LU;

            }

        }

    }
}

