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
            <asp:TextBox ID="txtNumeroDoc" runat="server" name="doc" placeholder="Numero Doc" CssClass="form-control"></asp:TextBox>
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
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" name="email"></asp:TextBox>
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
            setTimeout(function () { swal("Usuario Registrado Correctamente!"); }, 2000);

        }

    </script>
</asp:Content>
