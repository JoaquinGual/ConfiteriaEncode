using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Detalle_Factura
    {
		private int idDetalle;

		public int pIdDetalle
		{
			get { return idDetalle; }
			set { idDetalle = value; }
		}
		private int idFactura;

		public int pIdFactura
		{
			get { return idFactura; }
			set { idFactura = value; }
		}
		private int idArticulo;

		public int pIdArticulo
		{
			get { return idArticulo; }
			set { idArticulo = value; }
		}

		private int cantidad;

		public int pCantidad
		{
			get { return cantidad; }
			set { cantidad = value; }
		}




	}
}
