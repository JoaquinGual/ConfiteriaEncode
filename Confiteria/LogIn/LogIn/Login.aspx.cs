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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["nombreuser"] = null;
            Session["tipouser"] = null;
        }

       

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            bool tipoUser = false;
            string Usuario = txtUsuario.Text;
            string Contraseña = txtContraseña.Text;
            List<Usuario> LU = BLLUser.ValidarUsuario(Usuario, Contraseña);

            Usuario u = LU.FirstOrDefault(x => x.pNombreUsuario == Usuario);
            if (u != null)
            {
                
               tipoUser = u.pTipoUser;
                Session["tipouser"] = tipoUser;
                Session["nombreuser"] = txtUsuario.Text;
                Response.Redirect("Index.aspx?");
                

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "userNotExist();", true);
            }


            
            
        }
    }
}