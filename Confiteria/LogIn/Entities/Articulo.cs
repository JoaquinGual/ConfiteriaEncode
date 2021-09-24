using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Articulo
    {
        private int idArticulo;

        public int pIdArticulo
        {
            get { return idArticulo; }
            set { idArticulo = value; }
        }
        private string descripcion;

        public string pDescripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        private decimal precio;

        public decimal pPrecio
        {
            get { return precio; }
            set { precio = value; }
        }

        private int idRubro;

        public int pIdRubro
        {
            get { return idRubro; }
            set { idRubro = value; }
        }
        private bool activo;

        public bool pActivo
        {
            get { return activo; }
            set { activo = value; }
        }

        public Articulo()
        {
            idArticulo = 0;
            descripcion = "";
            precio = 0;
            idRubro = 0;
            activo = false;
        }

    }
}
