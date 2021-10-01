<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Lista.aspx.cs" Inherits="LogIn.Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function SelectBefore() {
            swal("Seleccione un usuario antes de eliminar!");
        }
        function DeleteOk() {
            swal("Usuario eliminado Correctamente!");
        }

    </script>

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvListaDeUsuarios" runat="server" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gvListaDeUsuarios_SelectedIndexChanged" CssClass="table mt-5"
                OnRowDeleting="gvListaDeUsuarios_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvListaDeUsuarios_RowDataBound">
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:CommandField ShowSelectButton="true" ButtonType="Button" ShowHeader="False" />
                    <asp:BoundField DataField="pId" HeaderText="ID" />
                    <asp:BoundField DataField="pNombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="pApellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="pTipoDocumento" HeaderText="Tipo Documento" />
                    <asp:BoundField DataField="pNumeroDocumento" HeaderText="Numero Documento" />
                    <asp:BoundField DataField="pEmail" HeaderText="Email" />
                    <asp:BoundField DataField="pNombreUsuario" HeaderText="Usuario" />
                    <asp:BoundField DataFormatString="******" DataField="pPassword" HeaderText="Contraseña" />
                    <asp:BoundField DataField="pTipoUser" HeaderText="Tipo Usuario" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnQuitar" ButtonType="LinkButton" runat="server"
                                Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#602a06" Font-Bold="True" ForeColor="White" />
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



    <%-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>



</asp:Content>
