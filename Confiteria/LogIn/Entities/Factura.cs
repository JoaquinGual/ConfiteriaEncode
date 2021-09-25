using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Factura
    {
		private int idFactura;

		public int pIdFactura
		{
			get { return idFactura; }
			set { idFactura = value; }
		}

		private DateTime fechaEmision;

		public DateTime pFechaEmision
		{
			get { return fechaEmision; }
			set { fechaEmision = value; }
		}

		private int idMozo;

		public int pIdMozo
		{
			get { return idMozo; }
			set { idMozo = value; }
		}

	}
}
