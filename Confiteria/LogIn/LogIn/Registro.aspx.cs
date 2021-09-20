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

        protected void btnRegistro_Click(object sender, EventArgs e)
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