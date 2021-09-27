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
    public partial class RegistroArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ViewState["primero"] = true;

                CargarListaArticulos();
                CargarComboRubro(cmbRubro);
            }
        }

        public void CargarComboRubro(DropDownList combo)
        {
            
            List<Rubro> LRV = BLLRubro.CargarListaRubros("Rubros").FindAll(u => u.pActivo == true);
            

            for (int i = 0; i < LRV.Count; i++)
            {
                
                combo.Items.Add(new ListItem(LRV[i].pNombreRubro, LRV[i].pIdRubro.ToString()));
            }
        }

        public void CargarListaArticulos()
        {

            List<Articulo> LA = BLLArticulo.CargarListaArticulo("Articulos");
            HttpContext.Current.Session["Articulos"] = LA;
            gvListaDeArticulos.DataSource = HttpContext.Current.Session["Articulos"];

            gvListaDeArticulos.DataBind();

        }
        public bool ValidarDatos()
        {
            if (cmbRubro.SelectedIndex == -1)
            {


                return false;
            }
            if (txtDescripcion.Text == "")
            {

                return false;
            }
            if (txtPrecio.Text == "")
            {

                return false;
            }
            return true;
        }
        public void LimpiarLista()
        {
            gvListaDeArticulos.SelectedIndex = -1;
            Session["idArticulo"] = null;
            gvListaDeArticulos.Rows[int.Parse(Session["index"].ToString())].Cells[6].Enabled = false;

        }

        protected void gvListaDeArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (bool.Parse(ViewState["primero"].ToString()) == false)
            {
                gvListaDeArticulos.Rows[int.Parse(Session["index"].ToString())].Cells[6].Enabled = false;
            }




            int index = gvListaDeArticulos.SelectedIndex;
            var id = gvListaDeArticulos.SelectedRow.Cells[1].Text;
            Session["idArticulo"] = id;
            Session["index"] = index;
            gvListaDeArticulos.SelectedRow.Cells[6].Enabled = true;
            ViewState["primero"] = false;
        }

        protected void gvListaDeArticulos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["idArticulo"] != null)
            {


                int rowIndex = e.RowIndex;
                List<Articulo> LA = (List<Articulo>)HttpContext.Current.Session["Articulos"];
                Articulo a = LA.FirstOrDefault(u => u.pIdArticulo == int.Parse(Session["idArticulo"].ToString()));

                if (a.pActivo != false)
                {
                    if (BLLArticulo.bajaArticulos(a))
                    {
                        LA[rowIndex].pActivo = false;
                        HttpContext.Current.Session["Articulos"] = LA;
                        gvListaDeArticulos.DataSource = LA;
                        gvListaDeArticulos.DataBind();

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "BajaOk();", true);
                        LimpiarLista();
                    }



                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "NotActive();", true);
                    LimpiarLista();
                }

            }
            else
            {

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "SelectBefore();", true);
            }
        }

        protected void gvListaDeArticulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[6].Enabled = false;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            List<Articulo> LA = (List<Articulo>)HttpContext.Current.Session["Articulos"];
            Articulo a = LA.FirstOrDefault(u => u.pIdArticulo == int.Parse(Session["idArticulo"].ToString()));
            ViewState["idArticuloEdit"] = a.pIdArticulo;
            txtDescripcionArticuloM.Text = a.pDescripcion;
            txtPrecioArticuloM.Text = a.pPrecio.ToString();
            CargarComboRubro(cmbRubroArticuloM);
            cmbRubroArticuloM.SelectedValue = a.pIdRubro.ToString();
            if (a.pActivo)
            {
                chkActivoArticuloM.Checked = true;
            }
            else
            {
                chkActivoArticuloM.Checked = false;
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Entities.Articulo a = new Entities.Articulo();
            a.pIdArticulo = int.Parse(ViewState["idArticuloEdit"].ToString());
            a.pDescripcion = txtDescripcionArticuloM.Text;
            a.pPrecio = decimal.Parse(txtPrecioArticuloM.Text);
            a.pIdRubro = int.Parse(cmbRubro.SelectedValue);
            a.pActivo = chkActivoArticuloM.Checked;

            if (BLLArticulo.ActualizarArticulo(a) == true)
            {

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "MUpdateOk();", true);
                CargarListaArticulos();
            }
            else
            {
                Response.Write("<script>alert('inCorrecto')</script>");
            }
        }


        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Entities.Articulo a = new Entities.Articulo();

            if (ValidarDatos())
            {
                a.pDescripcion = txtDescripcion.Text;
                a.pPrecio = decimal.Parse(txtPrecio.Text);

                a.pIdRubro = int.Parse(cmbRubro.SelectedValue);
                a.pActivo = chkActivo.Checked;

                if (BLLArticulo.InsertarArticulo(a) == true)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MInsertOk();", true);
                    CargarListaArticulos();
                }
                else
                {
                    Response.Write("<script>alert('inCorrecto')</script>");
                }
            }
        }
    }
}