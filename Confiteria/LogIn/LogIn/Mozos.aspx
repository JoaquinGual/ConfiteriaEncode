<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="Mozos.aspx.cs" Inherits="LogIn.Mozos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-row d-flex justify-content-center mt-5">
        <div class="form-group col-md-4 ml-1">
            <asp:Label ID="lblLocal" runat="server" Text="Sucursal a la que pertenece"></asp:Label>
            <asp:DropDownList ID="cmbLocal" runat="server" CssClass="form-control">
               
            </asp:DropDownList>
        </div>
        
    </div>

    <div class="form-row d-flex justify-content-center">
        <div class="form-group col-md-4">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre del Mozo"></asp:Label>
            <asp:TextBox ID="txtNombreMozo" runat="server" placeholder="Nombre del Mozo" CssClass="form-control" name="nombre"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
            <asp:Label ID="lblApellido" runat="server" Text="Apellido del Mozo"></asp:Label>
            <asp:TextBox ID="txtApellidoMozo" runat="server" placeholder="Apellido del Mozo" CssClass="form-control" name="apellido"></asp:TextBox>
        </div>
    </div>
    <div class="form-row d-flex justify-content-center mt-2">
        <div class="form-group col-md-4">
            <asp:Label ID="lblComision" runat="server" Text="Comision del Mozo"></asp:Label>
            <asp:TextBox ID="txtComision" runat="server" placeholder="Comision del Mozo" CssClass="form-control" name="user"></asp:TextBox>
        </div>
    </div>
    <div class="d-flex justify-content-center">
    <div class="form-group col-md-12 d-flex justify-content-sm-center">
            <asp:Label ID="lblActivo" runat="server" Text="Se encuentra en actividad ?"></asp:Label>
            <asp:CheckBox runat="server" ID="chkActivo"  CssClass="ml-3"/>
        </div>
        </div>
    

    <div class="modal-footer d-flex justify-content-center">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <asp:Button ID="btnRegistro" runat="server" Text="Registrar Mozo" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="btnRegistro_Click" />
    </div>
</asp:Content>
