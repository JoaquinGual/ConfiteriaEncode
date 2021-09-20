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
                List<Usuario> LU = BLLUser.CargarListaUsuarios("Usuarios");
                HttpContext.Current.Session["Usuarios"] = LU;
                gvListaDeUsuarios.DataSource = HttpContext.Current.Session["Usuarios"];

                gvListaDeUsuarios.DataBind();
            }
            
        }

        protected void gvListaDeUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["id"] != null)
            {
                int rowIndex = e.RowIndex;
                List<Usuario> LU = (List<Usuario>)HttpContext.Current.Session["Usuarios"];
                Usuario user = LU.FirstOrDefault(u => u.pId == int.Parse(Session["id"].ToString()));

                if (BLLUser.EliminarUsuario(user))
                {
                    Session["id"] = null;
                }
                
                LU.RemoveAt(rowIndex);
                HttpContext.Current.Session["Usuarios"] = LU;
                gvListaDeUsuarios.DataSource = LU;
                gvListaDeUsuarios.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "SelectBefore();", true);
            }
            
        }

        protected void gvListaDeUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = gvListaDeUsuarios.SelectedRow.Cells[1].Text;
            Session["id"] = id;
            
        }

    }
}