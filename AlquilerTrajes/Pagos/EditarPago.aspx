<%@ Page Title="Editar Pago" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditarPago.aspx.cs" Inherits="AlquilerTrajes.Admin.EditarPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Editar Pago</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">

                <div class="form-group mb-3">
                    <label>Reserva:</label>
                    <asp:DropDownList ID="ddlReserva" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                        ClientIDMode="Static" Enabled="false">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Monto Pagado:</label>
                    <asp:TextBox ID="txtMonto" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Pago:</label>
                    <asp:TextBox ID="txtFechaPago" runat="server" CssClass="form-control" TextMode="Date" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Método de Pago:</label>
                    <asp:DropDownList ID="ddlMetodoPago" runat="server" CssClass="form-control" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="tarjeta" Value="tarjeta" />
                        <asp:ListItem Text="transferencia" Value="transferencia" />
                        <asp:ListItem Text="efectivo" Value="efectivo" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Estado del Pago:</label>
                    <asp:DropDownList ID="ddlEstadoPago" runat="server" CssClass="form-control" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="pendiente" Value="pendiente" />
                        <asp:ListItem Text="pagado" Value="pagado" />
                        <asp:ListItem Text="reembolsado" Value="reembolsado" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Referencia de Pago:</label>
                    <asp:TextBox ID="txtReferencia" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>

                <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary w-100" Text="Actualizar Pago"
                    OnClick="btnActualizar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Pagos/VerPagos.aspx") %>' class="btn btn-secondary w-100 mt-2">Cancelar</a>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
