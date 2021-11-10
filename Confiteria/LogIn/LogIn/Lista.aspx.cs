using BusinessLogicLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class Lista : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["primero"] = true;
                CargarListaUsuarios();
            }
            
        }

       
        public void CargarListaUsuarios()
        {
            List<Usuario> LU = BLLUser.CargarListaUsuarios("Usuarios");
            HttpContext.Current.Session["Usuarios"] = LU;
            gvListaDeUsuarios.DataSource = HttpContext.Current.Session["Usuarios"];
            gvListaDeUsuarios.DataBind();

        }

        protected void gvListaDeUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Usuario u = new Usuario();
            u.pId = int.Parse(Session["idUsuario"].ToString());

            if (BLLUser.EliminarUsuario(u))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "sweetAlert", "DeleteOk();", true);
                CargarListaUsuarios();

            }


        }

        protected void gvListaDeUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = gvListaDeUsuarios.SelectedIndex;
            Session["index"] = index;
            if (bool.Parse(ViewState["primero"].ToString()) == false)
            {
                gvListaDeUsuarios.Rows[int.Parse(Session["index"].ToString())].Cells[10].Enabled = false;
            }





            var id = gvListaDeUsuarios.SelectedRow.Cells[1].Text;
            Session["idUsuario"] = id;

            gvListaDeUsuarios.SelectedRow.Cells[10].Enabled = true;
            ViewState["primero"] = false;

        }

        protected void gvListaDeUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[10].Enabled = false;
        }
    }
}