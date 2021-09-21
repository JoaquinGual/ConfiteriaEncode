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
    public partial class Mozos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ViewState["primero"] = true;
                
                CargarListaMozos();
                List<Local> LL = BLLLocal.CargarListaLocales("Locales");
                
                for (int i = 0; i < LL.Count; i++)
                {
                    cmbLocal.Items.Add(LL[i].pIdLocal.ToString());
                }
            }
        }

        public void CargarListaMozos()
        {
            List<Mozo> LM = BLLMozo.CargarListaMozo("Mozos");
            HttpContext.Current.Session["Mozos"] = LM;
            gvListaDeMozos.DataSource = HttpContext.Current.Session["Mozos"];

            gvListaDeMozos.DataBind();
            
        }
        protected void btnRegistro_Click(object sender, EventArgs e)
        {

            Entities.Mozo m = new Entities.Mozo();
            
            m.pNombre = txtNombreMozo.Text;
            m.pApellido = txtApellidoMozo.Text;
            
            m.pComision = int.Parse(txtComision.Text);
            m.pIdLocal = int.Parse(cmbLocal.SelectedValue);
            m.pActivo = chkActivo.Checked;

            if (BLLMozo.InsertarMozo(m) == true)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MInsertOk();", true);
                CargarListaMozos();
            }
            else
            {
                Response.Write("<script>alert('inCorrecto')</script>");
            }
        }

        protected void gvListaDeMozos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (bool.Parse(ViewState["primero"].ToString()) == false)
            {
                gvListaDeMozos.Rows[int.Parse(Session["index"].ToString())].Cells[7].Enabled = false;
            }
           



            int index = gvListaDeMozos.SelectedIndex;
            var id = gvListaDeMozos.SelectedRow.Cells[1].Text;
            Session["idMozo"] = id;
            Session["index"] = index;
            gvListaDeMozos.SelectedRow.Cells[7].Enabled = true;
            ViewState["primero"] = false;
           


        }


        protected void gvListaDeMozos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //if (Session["idMozo"] != null)
            //{
            //    gvListaDeMozos.EditIndex = e.NewEditIndex;
                
                
            //    List<Mozo> LM = (List<Mozo>)HttpContext.Current.Session["Mozos"];
            //    Mozo m = LM.FirstOrDefault(u => u.pIdMozo == int.Parse(Session["idMozo"].ToString()));

            //    if (BLLMozo.bajaMozos(m))
            //    {
            //        Session["idMozo"] = null;
            //    }

                
            //    HttpContext.Current.Session["Mozos"] = LM;
            //    gvListaDeMozos.DataSource = LM;
            //    gvListaDeMozos.DataBind();
            //}
            //else
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "SelectBefore();", true);
            //}
        }


        protected void gvListaDeMozos_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["idMozo"] != null)
            {


                int rowIndex = e.RowIndex;
                List<Mozo> LM = (List<Mozo>)HttpContext.Current.Session["Mozos"];
                Mozo m = LM.FirstOrDefault(u => u.pIdMozo == int.Parse(Session["idMozo"].ToString()));

                if (m.pActivo != false)
                {
                    if (BLLMozo.bajaMozos(m))
                    {
                        LM[rowIndex].pActivo = false;
                        HttpContext.Current.Session["Mozos"] = LM;
                        gvListaDeMozos.DataSource = LM;
                        gvListaDeMozos.DataBind();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "BajaOk();", true);
                        LimpiarLista();
                    }
                   

                    
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "NotActive();", true);
                    LimpiarLista();
                }
                
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "SelectBefore();", true);
            }
        }

        protected void gvListaDeMozos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[7].Enabled = false;
        }

        public void LimpiarLista()
        {
            gvListaDeMozos.SelectedIndex = -1;
            Session["idMozo"] = null;
            gvListaDeMozos.Rows[int.Parse(Session["index"].ToString())].Cells[7].Enabled = false;
            
        }
    }
}