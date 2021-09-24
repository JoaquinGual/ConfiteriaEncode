<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="GenerarFactura.aspx.cs" Inherits="LogIn.GenerarFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="generarFactura" runat="server">
        <div class="form-row d-flex justify-content-center mt-5">
            <div class="form-group col-md-4">
                <div class="d-flex justify-content-center">
                    <asp:Label ID="lblFechaEmision" runat="server" Text="Fecha de Emision"></asp:Label>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:Calendar ID="dtpFechaEmision" runat="server"></asp:Calendar>
                </div>

            </div>
        </div>
        <div class="form-row d-flex justify-content-center mt-5" id="formvalid">
            <div class="form-group col-md-4 ml-1">
                <asp:Label ID="lblMozo" runat="server" Text="Mozo"></asp:Label>
                <asp:DropDownList ID="cmbMozo" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>


        <div class="modal-footer d-flex flex-row-reverse justify-content-center">
            <button type="button" class="btn btn-secondary">Cancelar</button>
            <asp:Button ID="btnGenerar" runat="server" Text="Generar nueva Venta" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="btnGenerar_Click" />
        </div>
    </div>
    <hr />
    <div id="generarDetalle" runat="server">
    <div class="d-flex justify-content-center">
        <h1 class="titulo">Agregue articulos a su Venta</h1>
    </div>
    <div class="d-flex flex-column-reverse">
    <div class="form-row d-flex justify-content-center mt-5">
            <div class="form-group col-md-4">
                <div>
                    <asp:Label ID="lblCantidad" runat="server" Text="Cantidad"></asp:Label>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:TextBox ID="txtCantidad" runat="server" placeholder="Cantidad" CssClass="form-control" name="cantidad"></asp:TextBox>
                </div>

            </div>
        </div>
        <div class="form-row d-flex justify-content-center mt-5">
            <div class="form-group col-md-4 ml-1">
                <asp:Label ID="lblArticulo" runat="server" Text="Articulo"></asp:Label>
                <asp:DropDownList ID="cmbArticulo" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        </div>


        <div class="modal-footer d-flex flex-row-reverse justify-content-center">
            <button type="button" class="btn btn-secondary">Cancelar</button>
            <asp:Button ID="btnArticulo" runat="server" Text="Agregar Articulo" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="btnArticulo_Click" />
        </div>
        </div>


</asp:Content>
