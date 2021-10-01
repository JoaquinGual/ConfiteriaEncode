<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="Mozos.aspx.cs" Inherits="LogIn.Mozos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
       
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
                   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
         <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/additional-methods.js'></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    
    <div class="form-row d-flex justify-content-center mt-5" id="formvalid">
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
            <asp:TextBox ID="txtComision" runat="server" placeholder="Comision del Mozo" CssClass="form-control" name="user" onkeypress="return solonmeros(event);" oncopy="return false" onpaste="return false"></asp:TextBox>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <div class="form-group col-md-12 d-flex justify-content-sm-center">
            <asp:Label ID="lblActivo" runat="server" Text="Se encuentra en actividad ?"></asp:Label>
            <asp:CheckBox runat="server" ID="chkActivo" CssClass="ml-3" />
        </div>
    </div>


    <div class="modal-footer d-flex justify-content-center">
        <asp:Button ID="btnRegistro" runat="server" Text="Registrar Mozo" CssClass="btn btn-success" UseSubmitBehavior="False" OnClick="btnRegistro_Click" />
    </div>


    <hr />

   <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvListaDeMozos" runat="server" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="gvListaDeMozos_SelectedIndexChanged" CssClass="table mt-5"
                OnRowUpdating="gvListaDeMozos_RowUpdating1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvListaDeMozos_RowDataBound">
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:CommandField ShowSelectButton="true" ButtonType="Button" ControlStyle-CssClass="btn-outline-dark" ShowHeader="False"  />
                    <asp:BoundField DataField="pIdMozo" HeaderText="ID" />
                    <asp:BoundField DataField="pNombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="pApellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="pComision" HeaderText="Comision" />
                    <asp:BoundField DataField="pIdLocal" HeaderText="Local" />
                    <asp:BoundField DataField="pActivo" HeaderText="Actividad" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnBaja" ButtonType="LinkButton" runat="server"
                                Text="Baja" CssClass="btn btn-danger" CommandName="Update" />
                            <asp:Button ID="btnModificar" ButtonType="LinkButton" runat="server"
                                Text="Modificar" CssClass="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop" OnClick="btnModificar_Click" />
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

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Modificar Mozo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="form-row d-flex justify-content-center">
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblNombreMozo" runat="server" Text="Nombre del Mozo"></asp:Label>
                                <asp:TextBox ID="txtNombreMozoM" runat="server" placeholder="Nombre" CssClass="form-control" name="nombre"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblApellidoMozo" runat="server" Text="Apellido del Mozo"></asp:Label>
                                <asp:TextBox ID="txtApellidoMozoM" runat="server" placeholder="Apellido" CssClass="form-control" name="apellido" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row d-flex justify-content-center">
                            <div class="form-group col-md-4">
                                <asp:Label ID="lblComisionMozo" runat="server" Text="Comision"></asp:Label>
                                <asp:TextBox ID="txtComisionMozoM" runat="server" placeholder="Comision" CssClass="form-control" name="comision" onkeypress="return solonmeros(event);" oncopy="return false" onpaste="return false"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-4 ml-1">
                                <asp:Label ID="lblSucursalMozo" runat="server" Text="Sucursal"></asp:Label>
                                <asp:DropDownList ID="cmbSucursalMozoM" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="d-flex justify-content-center">
                                <div class="form-group col-md-12 d-flex justify-content-sm-center">
                                    <asp:Label ID="lblActivoMozo" runat="server" Text="Se encuentra en actividad ?"></asp:Label>
                                    <asp:CheckBox runat="server" ID="chkActivoMozoM" CssClass="ml-3" />
                                </div>
                            </div>
                        </div>



                        <div class="modal-footer">
                            <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btn btn-secondary" UseSubmitBehavior="false" data-bs-dismiss="modal" />
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-warning" UseSubmitBehavior="True" OnClick="btnGuardar_Click" data-bs-dismiss="modal" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
  
    <script>
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
    

    

    <script>
       

        function Combo() {
            setTimeout(function () { swal("Seleccione Sucursal!"); },0);

        }
        function Nombre() {
            setTimeout(function () { swal("Ingrese Nombre"); },0);

        }
        function Apellido() {
            setTimeout(function () { swal("Ingrese Apellido!"); }, 0);

        }

        function Comision() {
            setTimeout(function () { swal("Ingrese Comision!"); }, 0);

        }

        function MInsertOk() {
            setTimeout(function () { swal("Mozo Registrado Correctamente!"); }, 1000);

        }
        function SelectBefore() {
            setTimeout(function () { swal("Seleccione un Mozo!"); }, 500);

        }
        function NotActive() {
            setTimeout(function () { swal("Este Mozo ya no se encuentra activo!"); }, 500);

        }

        function BajaOk() {
            setTimeout(function () { swal("Mozo dado de baja correctamente!"); }, 500);

        }
        function MUpdateOk() {
            setTimeout(function () { swal("Mozo Actualizado Correctamente!"); }, 500);

        }



    </script>
</asp:Content>
