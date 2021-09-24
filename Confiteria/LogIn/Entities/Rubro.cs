using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
   public class Rubro
    {
        private int idRubro;

        public int pIdRubro
        {
            get { return idRubro; }
            set { idRubro = value; }
        }

        private string nombreRubro;

        public string pNombreRubro
        {
            get { return nombreRubro; }
            set { nombreRubro = value; }
        }

        private bool activo;

        public bool pActivo
        {
            get { return activo; }
            set { activo = value; }
        }



    }
}
