using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class GenerarFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            generarDetalle.Visible = false;
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            generarFactura.Visible = false;
            generarDetalle.Visible = true;
        }



        protected void btnArticulo_Click(object sender, EventArgs e)
        {

        }
    }
}