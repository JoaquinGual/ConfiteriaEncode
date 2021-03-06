<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="GenerarFactura.aspx.cs" Inherits="LogIn.GenerarFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    
    <div id="generarFactura" runat="server">
        <div class="form-row d-flex justify-content-center mt-5">
            <div class="form-group col-md-4">
                <div class="d-flex justify-content-center">
                    <asp:Label ID="lblFechaEmision" runat="server" Text="Fecha de Emision"></asp:Label>
                </div>
                <asp:UpdatePanel runat="server">
        <ContentTemplate>
                <div class="d-flex justify-content-center">
                    <asp:Calendar ID="dtpFechaEmision" runat="server"></asp:Calendar>
                </div>
                </ContentTemplate>
    </asp:UpdatePanel>

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
    <div id="generarDetalle" runat="server">
    <div class="d-flex justify-content-center">
        <h1 class="titulo">Agregue articulos a su Venta</h1>
    </div>
        <div>
            <asp:Label ID="lblIdFactura" runat="server" Text=""></asp:Label>
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

            <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvListaDetalle" runat="server" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gvListaDetalle_SelectedIndexChanged" CssClass="table mt-5"
                OnRowDeleting="gvListaDetalle_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvListaDetalle_RowDataBound">
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:CommandField ShowSelectButton="true" ButtonType="Button" ControlStyle-CssClass="btn-outline-dark" ShowHeader="False" />
                    <asp:BoundField DataField="pIdDetalle" HeaderText="ID" />
                    <asp:BoundField DataField="pIdArticulo" HeaderText="Numero de Articulo" />
                    <asp:BoundField DataField="pCantidad" HeaderText="Cantidad" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnQuitar" ButtonType="LinkButton" runat="server"
                                Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" />           
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#4c5459" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

     <div class="modal-footer d-flex justify-content-center">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Venta" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="btnFinalizar_Click"  />
    </div>
        </div>




</asp:Content>
