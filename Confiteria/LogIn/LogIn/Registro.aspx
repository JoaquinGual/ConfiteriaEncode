<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="LogIn.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registro de Usuarios</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-row d-flex justify-content-center mt-5">
        <div class="form-group col-md-4 ml-1">
            <asp:Label ID="lblTipoDoc" runat="server" Text="Tipo Doc"></asp:Label>
            <asp:DropDownList ID="cmbTipo" runat="server" CssClass="form-control">
                <asp:ListItem>DNI</asp:ListItem>
                <asp:ListItem>L.E</asp:ListItem>
                <asp:ListItem>C.I</asp:ListItem>
                <asp:ListItem>Pasaporte</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group col-md-4 ml-1">
            <asp:Label ID="lblNumeroDoc" runat="server" Text="Nro Documento"></asp:Label>
            <asp:TextBox ID="txtNumeroDoc" runat="server" name="doc" placeholder="Numero Doc" CssClass="form-control" onkeypress="return solonmeros(event);" oncopy="return false" onpaste="return false"></asp:TextBox>
        </div>
    </div>

    <div class="form-row d-flex justify-content-center">
        <div class="form-group col-md-4">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre" CssClass="form-control" name="nombre"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <asp:Label ID="lblApellido" runat="server" Text="Apellido"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server" placeholder="Apellido" CssClass="form-control" name="apellido"></asp:TextBox>
        </div>
    </div>
    <div class="form-row d-flex justify-content-center mt-2">
        <div class="form-group col-md-4">
            <asp:Label ID="lblNombreUser" runat="server" Text="Usuario"></asp:Label>
            <asp:TextBox ID="txtUser" runat="server" placeholder="Usuario" CssClass="form-control" name="user"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña"></asp:Label>
            <asp:TextBox ID="txtContraseñaRegistro" runat="server" placeholder="Contraseña" CssClass="form-control" type="password" name="pass"></asp:TextBox>
        </div>
    </div>
    <div class="form-row d-flex justify-content-center">
        <div class="form-group col-md-4">
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" name="email" onkeyup="ValidateEmail();"></asp:TextBox>
            <span id="lblError" style="color: red"></span>
        </div>
    </div>
    <div class="form-row d-flex justify-content-center">
        <div class="form-group col-md-4 d-flex justify-content-around">
            <asp:Label ID="lblTipoUser" runat="server" Text="Administrador: "></asp:Label>
            <asp:CheckBox runat="server" ID="chkTipoUser" />
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <asp:Button ID="btnRegistro" runat="server" Text="Registrarme!" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="btnRegistro_Click" />
    </div>
    <script>
        function InsertOk() {
            setTimeout(function () { swal("Usuario Registrado Correctamente!"); }, 0);

        }
        function Documento() {
            setTimeout(function () { swal("Ingrese Numero de Documento!"); }, 0);

        }
        function Nombre() {
            setTimeout(function () { swal("Ingrese Nombre!"); }, 0);

        }
        function Apellido() {
            setTimeout(function () { swal("Ingrese Apellido!"); }, 0);

        }
        function Mail() {
            setTimeout(function () { swal("Ingrese Mail!"); }, 0);

        }
        function Usuario() {
            setTimeout(function () { swal("Ingrese Usuario!"); }, 0);

        }
        function Contraseña() {
            setTimeout(function () { swal("Ingrese Contraseña!"); }, 0);

        }

    </script>

     <script>
         function ValidateEmail() {
             var email = document.getElementById("ContentPlaceHolder1_txtEmail").value;
             var lblError = document.getElementById("lblError");
             lblError.innerHTML = "";
             var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
             if (!expr.test(email)) {
                 lblError.innerHTML = "Invalid email address.";
             }
         }

         function solonmeros(e) {

             var key;

             if (window.event) // IE
             {
                 key = e.keyCode;
             }
             else if (e.which) // Netscape/Firefox/Opera
             {
                 key = e.which;
             }

             if (key < 48 || key > 57) {
                 return false;
             }

             return true;
         }

     </script>
</asp:Content>
