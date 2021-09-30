using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace LogIn
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtpFecha.SelectedDate = DateTime.Today;
                lblTotal.Visible = false;
                lblTotalPorDia.Visible = false;
            }
            
            
        }

        protected void btnVentasPorDia_Click(object sender, EventArgs e)
        {
            gvTotalPorDia.DataSource = BLLDetalle_Factura.ventasPorDia(dtpFecha.SelectedDate);
            gvTotalPorDia.DataBind();
            string fecha = dtpFecha.SelectedDate.ToString();
            lblFecha1.Text = fecha;
            lblTotalPorDia.Text = BLLDetalle_Factura.totalPorDia(dtpFecha.SelectedDate).ToString();
            lblTotalPorDia.Visible = true;
            lblTotal.Visible = true;
            
        }
    }
}