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
                CargarComboLocal(cmbLocal);
            }
        }

        public void CargarComboLocal(DropDownList combo)
        {
            List<Local> LL = BLLLocal.CargarListaLocales("Locales");

            for (int i = 0; i < LL.Count; i++)
            {
                combo.Items.Add(LL[i].pIdLocal.ToString());
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

            if (ValidarDatos())
            {
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

        public bool ValidarDatos()
        {
            if (cmbLocal.SelectedIndex == -1)
            {


                return false;
            }
            if (txtNombreMozo.Text == "")
            {

                return false;
            }
            if (txtApellidoMozo.Text == "")
            {

                return false;
            }
            if (txtComision.Text == "")
            {

                return false;
            }
            return true;
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

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            List<Mozo> LM = (List<Mozo>)HttpContext.Current.Session["Mozos"];
            Mozo m = LM.FirstOrDefault(u => u.pIdMozo == int.Parse(Session["idMozo"].ToString()));
            ViewState["idMozoEdit"] = m.pIdMozo;
            txtNombreMozoM.Text = m.pNombre;
            txtApellidoMozoM.Text = m.pApellido;
            txtComisionMozoM.Text = m.pComision.ToString() ;
            CargarComboLocal(cmbSucursalMozoM);
            cmbSucursalMozoM.SelectedValue = m.pIdLocal.ToString();
            if (m.pActivo)
            {
                chkActivoMozoM.Checked = true;
            }
            else
            {
                chkActivoMozoM.Checked = false;
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Entities.Mozo m = new Entities.Mozo();
            m.pIdMozo = int.Parse(ViewState["idMozoEdit"].ToString());
            m.pNombre = txtNombreMozoM.Text;
            m.pApellido = txtApellidoMozoM.Text;

            m.pComision = int.Parse(txtComisionMozoM.Text);
            m.pIdLocal = int.Parse(cmbLocal.SelectedValue);
            m.pActivo = chkActivoMozoM.Checked;

            if (BLLMozo.ActualizarMozo(m) == true)
            {

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "MUpdateOk();", true);
                CargarListaMozos();
            }
            else
            {
                Response.Write("<script>alert('inCorrecto')</script>");
            }
        }
    }
}