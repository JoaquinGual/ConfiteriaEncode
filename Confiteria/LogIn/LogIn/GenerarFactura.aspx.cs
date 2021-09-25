using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BusinessLogicLayer;

namespace LogIn
{
    public partial class GenerarFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["primero"] = true;
                generarDetalle.Visible = false;
                dtpFechaEmision.SelectedDate = DateTime.Now;
                CargarComboMozo(cmbMozo);
                CargarComboArticulos(cmbArticulo);

            }

        }
        public bool ValidarDatosFactura()
        {
            if (cmbMozo.SelectedIndex == -1)
            {


                return false;
            }
            if (dtpFechaEmision.SelectedDate == null)
            {

                return false;
            }
            return true;
        }

        public bool ValidarDatosDetalle()
        {
            if (cmbMozo.SelectedIndex == -1)
            {


                return false;
            }
            if (cmbArticulo.SelectedValue == null)
            {

                return false;
            }
            if (txtCantidad.Text == "")
            {
                return false;
            }
            return true;
        }
        public void CargarListaDetalle(Label label)
        {
            List<Factura> LF = BLLFactura.CargarListaFactura("Facturas");
            int idFactura = LF.Count;
            List<Detalle_Factura> LDF = BLLDetalle_Factura.CargarListaDetalle("Detalle_Facturas").FindAll(u => u.pIdFactura == idFactura);
            
            HttpContext.Current.Session["Detalles"] = LDF;
            
            gvListaDetalle.DataSource = HttpContext.Current.Session["Detalles"];
            label.Text = idFactura.ToString();
            gvListaDetalle.DataBind();


        }
        public void CargarComboArticulos(DropDownList combo)
        {
            List<Articulo> LAV = BLLArticulo.CargarListaArticulo("Articulos").FindAll(u => u.pActivo == true);


            for (int i = 0; i < LAV.Count; i++)
            {

                combo.Items.Add(new ListItem(LAV[i].pDescripcion, LAV[i].pIdArticulo.ToString()));
            }

        }
        public void CargarComboMozo(DropDownList combo)
        {
            List<Mozo> LMV = BLLMozo.CargarListaMozo("Mozos").FindAll(u => u.pActivo == true);


            for (int i = 0; i < LMV.Count; i++)
            {

                combo.Items.Add(new ListItem(LMV[i].pNombre + " " + LMV[i].pApellido, LMV[i].pIdMozo.ToString()));
            }

        }
        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            Entities.Factura f = new Entities.Factura();
            if (ValidarDatosFactura())
            {
                f.pFechaEmision = dtpFechaEmision.SelectedDate;
                f.pIdMozo = int.Parse(cmbMozo.SelectedValue);

                if (BLLFactura.InsertarFactura(f) == true)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MInsertOk();", true);
                    CargarListaDetalle(lblIdFactura);
                    generarFactura.Visible = false;
                    generarDetalle.Visible = true;


                }
                else
                {
                    Response.Write("<script>alert('inCorrecto')</script>");
                }
            }




        }



        protected void btnArticulo_Click(object sender, EventArgs e)
        {
            Entities.Detalle_Factura df = new Entities.Detalle_Factura();
            if (ValidarDatosDetalle())
            {
                df.pIdFactura = int.Parse(lblIdFactura.Text);
                df.pIdArticulo = int.Parse(cmbArticulo.SelectedValue);
                df.pCantidad = int.Parse(txtCantidad.Text);

                if (BLLDetalle_Factura.InsertarDetalle(df) == true)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MInsertOk();", true);
                    CargarListaDetalle(lblIdFactura);
                    generarFactura.Visible = false;
                    generarDetalle.Visible = true;

                }
                else
                {
                    Response.Write("<script>alert('inCorrecto')</script>");
                }
            }
        }

        protected void gvListaDetalle_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (bool.Parse(ViewState["primero"].ToString()) == false)
            {
                gvListaDetalle.Rows[int.Parse(Session["index"].ToString())].Cells[4].Enabled = false;
            }




            int index = gvListaDetalle.SelectedIndex;
            var id = gvListaDetalle.SelectedRow.Cells[1].Text;
            Session["idDetalle"] = id;
            Session["index"] = index;
            gvListaDetalle.SelectedRow.Cells[4].Enabled = true;
            ViewState["primero"] = false;
        }

        protected void gvListaDetalle_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].Enabled = false;
        }


        protected void gvListaDetalle_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Detalle_Factura df = new Detalle_Factura();
            df.pIdDetalle = int.Parse(Session["idDetalle"].ToString());

            if (BLLDetalle_Factura.EliminarDetalle(df))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "DeleteOk();", true);
                CargarListaDetalle(lblIdFactura);
            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            generarFactura.Visible = true;
            generarDetalle.Visible = false;
        }
    }
}