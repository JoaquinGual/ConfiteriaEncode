using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
     public class Local
    {
        private int idLocal;

        public int pIdLocal
        {
            get { return idLocal; }
            set { idLocal = value; }
        }

        private string direccion;

        public string pDireccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        private bool activo;

        public bool pActivo
        {
            get { return activo; }
            set { activo = value; }
        }


        public Local()
        {
            idLocal = 0;
            direccion = "";
            activo = false;
        }


    }
}
