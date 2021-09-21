using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
   public class Mozo
    {
        private int idMozo;

        public int pIdMozo
        {
            get { return idMozo; }
            set { idMozo = value; }
        }
        private string nombre;

        public string pNombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private string apellido;

        public string pApellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        private int comision;

        public int pComision
        {
            get { return comision; }
            set { comision = value; }
        }

        private int idLocal;

        public int pIdLocal
        {
            get { return idLocal; }
            set { idLocal = value; }
        }

        private bool activo;

        public bool pActivo
        {
            get { return activo; }
            set { activo = value; }
        }



		public Mozo()
        {
			idMozo = 0;
			nombre = "";
			apellido = "";
			comision = 0;
			idLocal = 0;
			activo = false;
        }

        public Mozo(int id,string nom,string ape,int com,int idloc,bool act)
        {
            idMozo = id;
            nombre = nom;
            apellido = ape;
            comision = com;
            idLocal = idloc;
            activo = act;
        }
	}


}
