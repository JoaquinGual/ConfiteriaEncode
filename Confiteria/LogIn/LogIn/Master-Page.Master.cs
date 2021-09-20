using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace LogIn
{
    public partial class Master_Page : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["nombreuser"] != null && Session["tipouser"] != null )
            {
                string userName = Session["nombreuser"].ToString();
                bool tipoUser = bool.Parse(Session["tipouser"].ToString());
                lblBienvenido.Text = "Bienvenido: " + userName;

                if (!tipoUser)
                {
                    registroUsuarios.Visible = false;
                    listaUsuarios.Visible = false;

                }
                else
                {
                    registroUsuarios.Visible = true;
                    listaUsuarios.Visible = true;

                }
            }
            else
            {
                Response.Redirect("Login.aspx?");
            }
            
           
         
                
               
         
            
            
        }

        
    }
}