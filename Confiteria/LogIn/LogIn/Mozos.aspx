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
    <hr />
    <asp:ScriptManager runat="server" />

    <asp:GridView ID="gvListaDeMozos" runat="server" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gvListaDeMozos_SelectedIndexChanged" CssClass="table mt-5" OnRowEditing="gvListaDeMozos_RowEditing"
 OnRowUpdating="gvListaDeMozos_RowUpdating1"     CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvListaDeMozos_RowDataBound" >
        <AlternatingRowStyle BackColor="White" />
        
        <Columns> 
            <asp:CommandField  ShowSelectButton="true" ButtonType="Button" ShowHeader="False" />
            <asp:BoundField DataField="pIdMozo" HeaderText="ID" />
            <asp:BoundField DataField="pNombre" HeaderText="Nombre" />
            <asp:BoundField DataField="pApellido" HeaderText="Apellido" />
            <asp:BoundField DataField="pComision" HeaderText="Comision" />
            <asp:BoundField DataField="pIdLocal" HeaderText="Local" />
            <asp:BoundField DataField="pActivo" HeaderText="Actividad" />
            
               <asp:TemplateField>                   
                       <ItemTemplate>                                                      
                           <asp:Button ID="btnBaja" ButtonType ="LinkButton" runat="server"
                               Text="Baja" class="btn btn-danger" CommandName="Update"  />
                           <asp:Button ID="btnModificar" ButtonType ="LinkButton" runat="server"
                               Text="Modificar" class="btn btn-warning" CommandName="Edit"  />                              
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
            
    <script>
        function MInsertOk() {
            setTimeout(function () { swal("Mozo Registrado Correctamente!"); }, 1000);

        }
        function SelectBefore() {
            setTimeout(function () { swal("Seleccione un Mozo!"); }, 500);

        }
        function NotActive() {
            setTimeout(function () { swal("Este Mozo ya no se encuentra activo!"); }, 3000);

        }

        function BajaOk() {
            setTimeout(function () { swal("Mozo dado de baja correctamente!"); }, 500);

        }
         
    </script>
   </asp:Content>      
