<%@ Page Title="Agregar Pago" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AgregarPago.aspx.cs" Inherits="AlquilerTrajes.Admin.AgregarPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Agregar Nuevo Pago</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Reserva:</label>
                    <asp:DropDownList ID="ddlReserva" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Monto Pagado:</label>
                    <asp:TextBox ID="txtMonto" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Number" />
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Pago:</label>
                    <asp:TextBox ID="txtFechaPago" runat="server" CssClass="form-control" TextMode="Date" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Método de Pago:</label>
                    <asp:DropDownList ID="ddlMetodoPago" runat="server" CssClass="form-control" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="Tarjeta" Value="tarjeta" />
                        <asp:ListItem Text="Transferencia" Value="transferencia" />
                        <asp:ListItem Text="Efectivo" Value="efectivo" />
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

                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success w-100" Text="Guardar Pago"
                    OnClientClick="return validarFormulario();" OnClick="btnGuardar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Pagos/VerPagos.aspx") %>' class="btn btn-secondary w-100 mt-2">Cancelar</a>
            </asp:Panel>
        </div>
    </div>

    <!-- Validación jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validarFormulario() {
            let valido = true;
            $(".text-danger-validate").remove();

            if ($('#ddlReserva').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione una reserva</span>').insertAfter('#ddlReserva');
                valido = false;
            }

            if ($('#txtMonto').val().trim() === '' || isNaN($('#txtMonto').val())) {
                $('<span class="text-danger text-danger-validate">Ingrese monto válido</span>').insertAfter('#txtMonto');
                valido = false;
            }

            if ($('#txtFechaPago').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese fecha de pago</span>').insertAfter('#txtFechaPago');
                valido = false;
            }

            if ($('#ddlMetodoPago').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione método de pago</span>').insertAfter('#ddlMetodoPago');
                valido = false;
            }

            if ($('#ddlEstadoPago').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione estado del pago</span>').insertAfter('#ddlEstadoPago');
                valido = false;
            }

            if ($('#txtReferencia').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese referencia</span>').insertAfter('#txtReferencia');
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
