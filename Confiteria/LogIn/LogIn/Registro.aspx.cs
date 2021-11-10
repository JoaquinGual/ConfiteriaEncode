using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool ValidarDatos()
        {
            if (cmbTipo.SelectedIndex == -1)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Combo();", true);
                return false;
            }
            if (txtNumeroDoc.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Documento();", true);
                return false;
            }
            if (txtNombre.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Nombre();", true);
                return false;
            }
            if (txtApellido.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Apellido();", true);
                return false;
            }
           
            if (txtUser.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Usuario();", true);
                return false;
            }
            if (txtContraseñaRegistro.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Contraseña();", true);
                return false;
            }
            if (txtEmail.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "Mail();", true);
                return false;
            }
            if (lblError.Value == "Mail Invalido!")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "MailErroneo();", true);
                return false;
            }


            return true;

        }
        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            if (ValidarDatos())
            {
                Entities.Usuario u = new Entities.Usuario();
                u.pTipoDocumento = cmbTipo.SelectedValue;
                u.pNumeroDocumento = txtNumeroDoc.Text;
                u.pNombre = txtNombre.Text;
                u.pApellido = txtApellido.Text;
                u.pEmail = txtEmail.Text;
                u.pNombreUsuario = txtUser.Text;
                u.pPassword = txtContraseñaRegistro.Text;
                u.pTipoUser = chkTipoUser.Checked;

                if (BLLUser.InsertarUsuario(u) == true)
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyFunction", "InsertOk();", true);

                }
                else
                {
                    Response.Write("<script>alert('inCorrecto')</script>");
                }
            }
           
        }
    }
}