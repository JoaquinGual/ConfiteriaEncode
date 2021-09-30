using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace LogIn
{
    public partial class RVentaPorMozo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtpFecha.SelectedDate = DateTime.Today;
                lblTotal.Visible = false;
                lblTotPagar.Visible = false;
                
            }
        }

        protected void btnVentasPorMozo_Click(object sender, EventArgs e)
        {
            gvTotalPorDia.DataSource = BLLDetalle_Factura.ventasPorMozo(dtpFecha.SelectedDate);
            gvTotalPorDia.DataBind();
            string fecha = dtpFecha.SelectedDate.ToString();
            lblFecha1.Text = fecha;
            decimal TotPagar = gvTotalPorDia.Rows.Cast<GridViewRow>().Sum(x => Convert.ToDecimal(x.Cells[4].Text));
            lblTotPagar.Text = Convert.ToString(TotPagar);
            lblTotPagar.Visible = true;
            lblTotal.Visible = true;
        }
    }
}