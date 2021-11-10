using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using Entities;

namespace LogIn
{
    public partial class RegistroRubros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ViewState["primero"] = true;

                CargarListaRubros();
                
            }
        }
        public void CargarListaRubros()
        {
            List<Rubro> LR = BLLRubro.CargarListaRubros("Rubros");
            HttpContext.Current.Session["Rubros"] = LR;
            gvListaDeRubros.DataSource = HttpContext.Current.Session["Rubros"];

            gvListaDeRubros.DataBind();

        }
        public bool ValidarDatos()
        {
           
            if (txtNombreRubro.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Rubro();", true);
                return false;
            }            
            return true;
        }
        public void LimpiarLista()
        {
            gvListaDeRubros.SelectedIndex = -1;
            Session["idRubro"] = null;
            gvListaDeRubros.Rows[int.Parse(Session["index"].ToString())].Cells[4].Enabled = false;

        }
        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            Entities.Rubro r = new Entities.Rubro();

            if (ValidarDatos())
            {
                r.pNombreRubro = txtNombreRubro.Text;
                r.pActivo = chkActivo.Checked;

                if (BLLRubro.InsertarRubro(r) == true)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MInsertOk();", true);
                    CargarListaRubros();
                }
                else
                {
                    Response.Write("<script>alert('inCorrecto')</script>");
                }
            }
        }

 

        protected void gvListaDeRubros_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (bool.Parse(ViewState["primero"].ToString()) == false)
            {
                gvListaDeRubros.Rows[int.Parse(Session["index"].ToString())].Cells[4].Enabled = false;
            }




            int index = gvListaDeRubros.SelectedIndex;
            var id = gvListaDeRubros.SelectedRow.Cells[1].Text;
            Session["idRubro"] = id;
            Session["index"] = index;
            gvListaDeRubros.SelectedRow.Cells[4].Enabled = true;
            ViewState["primero"] = false;
        }

        protected void gvListaDeRubros_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["idRubro"] != null)
            {


                int rowIndex = e.RowIndex;
                List<Rubro> LR = (List<Rubro>)HttpContext.Current.Session["Rubros"];
                Rubro r = LR.FirstOrDefault(u => u.pIdRubro == int.Parse(Session["idRubro"].ToString()));

                if (r.pActivo != false)
                {
                    if (BLLRubro.bajaRubros(r))
                    {
                        LR[rowIndex].pActivo = false;
                        HttpContext.Current.Session["Rubros"] = LR;
                        gvListaDeRubros.DataSource = LR;
                        gvListaDeRubros.DataBind();

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

        protected void gvListaDeRubros_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[4].Enabled = false;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            List<Rubro> LR = (List<Rubro>)HttpContext.Current.Session["Rubros"];
            Rubro r = LR.FirstOrDefault(u => u.pIdRubro == int.Parse(Session["idRubro"].ToString()));
            ViewState["idRubroEdit"] = r.pIdRubro;
            txtNombreRubroM.Text = r.pNombreRubro;
            if (r.pActivo)
            {
                chkActivoM.Checked = true;
            }
            else
            {
                chkActivoM.Checked = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Entities.Rubro r = new Entities.Rubro();
            r.pIdRubro = int.Parse(ViewState["idRubroEdit"].ToString());
            r.pNombreRubro = txtNombreRubroM.Text;
            r.pActivo = chkActivoM.Checked;

            if (BLLRubro.ActualizarRubro(r) == true)
            {

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "MUpdateOk();", true);
                CargarListaRubros();
            }
            else
            {
                Response.Write("<script>alert('inCorrecto')</script>");
            }
        }
    }
}