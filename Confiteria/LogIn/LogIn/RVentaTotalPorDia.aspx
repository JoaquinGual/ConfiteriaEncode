<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Page.Master" AutoEventWireup="true" CodeBehind="RVentaTotalPorDia.aspx.cs" Inherits="LogIn.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="d-flex justify-content-center">
                <div class="form-group col-md-4 ">
                    <div class="d-flex justify-content-center">
                        <asp:Label ID="lblFecha" runat="server" Text="Fecha"></asp:Label>
                    </div>
                    <div class="d-flex justify-content-center">
                        <asp:Calendar ID="dtpFecha" runat="server" SelectedDate=""></asp:Calendar>
                    </div>

                </div>
            </div>

            <div class="modal-footer d-flex flex-row-reverse justify-content-center">

                <asp:Button ID="btnVentasPorDia" runat="server" Text="Ver Ventas en Fecha" CssClass="btn btn-light" UseSubmitBehavior="False" OnClick="btnVentasPorDia_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="printear">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="d-flex justify-content-center">

                    <h3>Informe de ventas del Dia: </h3>
                </div>
                <div class="d-flex justify-content-center">

                    <asp:Label Text="" ID="lblFecha1" runat="server" CssClass="h5" />
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="ventasPorDiaPrint">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvTotalPorDia" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table mt-5"
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />

                        <Columns>

                            <asp:BoundField DataField="Articulo" HeaderText="ID" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                            <asp:BoundField DataField="Importe" HeaderText="Importe" />

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
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div>
                    <div class="d-flex justify-content-center">
                        <asp:Label Text="Total:" ID="lblTotal" CssClass="h3" runat="server" />
                    </div>
                    <div class="d-flex justify-content-center">
                        <asp:Label Text="asd" ID="lblTotalPorDia" CssClass="h3" runat="server" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="modal-footer d-flex flex-row-reverse justify-content-center">
        <button class="btn btn-dark" onclick="printDiv('printear')">Descargar</button>
        <%--<asp:Button ID="btnDescargar" runat="server" Text="Descargar" CssClass="btn login_btn" UseSubmitBehavior="False" OnClick="printDiv('ventasPorDiaPrint')" />--%>
    </div>

    <script>
        function printDiv(div) {
            // Create and insert new print section
            var elem = document.getElementById(div);
            var domClone = elem.cloneNode(true);
            var $printSection = document.createElement("div");
            $printSection.id = "printSection";
            $printSection.appendChild(domClone);
            document.body.insertBefore($printSection, document.body.firstChild);
            var master = document.getElementById("masterBody");
            master.remove();
            window.print();

            window.location.href = "/RVentaTotalPorDia.aspx"
            // Clean up print section for future use
            var oldElem = document.getElementById("printSection");
            if (oldElem != null) { oldElem.parentNode.removeChild(oldElem); }

            //oldElem.remove() not supported by IE

            return true;
        }
    </script>
</asp:Content>
