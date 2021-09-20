using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Usuario
    {
		private string nombre;
		private string apellido;
		private string numeroDocumento;
		private string tipoDocumento;
		private string email;
		private string nombreUsuario;
		private string password;
		private int id;
		private bool tipoUser;


		public Usuario()
		{
			nombre = "";
			apellido = "";
			numeroDocumento = "";
			tipoDocumento = "";		
			email = "";
			nombreUsuario = "";
			password = "";
			id = 0;
			tipoUser = false;
		}
		public Usuario(string nom, string ape, string numDoc, string tipoDoc, string mail, string nomUsu, string pass, int ID,bool tUser)
		{
			nombre = nom;
			apellido = ape;
			numeroDocumento = numDoc;
			tipoDocumento = tipoDoc;
			email = mail;
			nombreUsuario = nomUsu;
			password = pass;
			id = ID;
			tipoUser = tUser;
		}
		public bool pTipoUser
		{
			get { return tipoUser; }
			set { tipoUser = value; }
		}
		public int pId
		{
			get { return id; }
			set { id = value; }
		}

		public string pPassword
		{
			get { return password; }
			set { password = value; }
		}


		public string pNombreUsuario
		{
			get { return nombreUsuario; }
			set { nombreUsuario = value; }
		}


		public string pEmail
		{
			get { return email; }
			set { email = value; }
		}


		public string pTipoDocumento
		{
			get { return tipoDocumento; }
			set { tipoDocumento = value; }
		}


		public string pNumeroDocumento
		{
			get { return numeroDocumento; }
			set { numeroDocumento = value; }
		}


		public string pApellido
		{
			get { return apellido; }
			set { apellido = value; }
		}


		public string pNombre
		{
			get { return nombre; }
			set { nombre = value; }
		}
	}
}
