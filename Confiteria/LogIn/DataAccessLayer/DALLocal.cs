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
    public class DALLocal
    {

        public static Local CargarObjetoLocal(OleDbDataReader lector)
        {

            Local l = new Local();



            if (!lector.IsDBNull(0))
            {
                l.pIdLocal = lector.GetInt32(0);
            }
            if (!lector.IsDBNull(1))
            {
                l.pDireccion = lector.GetString(1);
            }          
            if (!lector.IsDBNull(2))
            {
                l.pActivo = lector.GetBoolean(2);
            }



            return l;
        }
        public static List<Local> cargarListaLocales(string Tabla)
        {
            try
            {
                List<Local> LL = new List<Local>();
                Datos oDatos = new Datos();
                oDatos.LeerTabla(Tabla);
                LL.Clear();
                while (oDatos.Lector.Read())
                {

                    LL.Add(CargarObjetoLocal(oDatos.Lector));
                }
                oDatos.Desconectar();
                return LL;
            }
            catch (Exception)
            {

                throw new Exception("Ha ocurrido un Error");
            }

        }
    }
}
