<%@ Page Title="Agregar Reserva" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AgregarReserva.aspx.cs" Inherits="AlquilerTrajes.Admin.AgregarReserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Agregar Nueva Reserva</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Cliente:</label>
                    <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Reserva:</label>
                    <asp:TextBox ID="txtFechaReserva" runat="server" CssClass="form-control" TextMode="Date" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Devolución:</label>
                    <asp:TextBox ID="txtFechaDevolucion" runat="server" CssClass="form-control" TextMode="Date" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" ClientIDMode="Static">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="cancelada" Value="cancelada" />
                        <asp:ListItem Text="finalizada" Value="finalizada" />
                        <asp:ListItem Text="confirmada" Value="confirmada" />
                        <asp:ListItem Text="pendiente" Value="pendiente" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Observaciones:</label>
                    <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" ClientIDMode="Static" />
                </div>

                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success w-100" Text="Guardar Reserva"
                    OnClientClick="return validarFormulario();" OnClick="btnGuardar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Reservas/VerReservas.aspx") %>' class="btn btn-secondary w-100 mt-2">Cancelar</a>
            </asp:Panel>
        </div>
    </div>

    <!-- Validación jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validarFormulario() {
            let valido = true;
            $(".text-danger-validate").remove();

            if ($('#ddlCliente').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione cliente</span>').insertAfter('#ddlCliente');
                valido = false;
            }

            if ($('#txtFechaReserva').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese fecha de reserva</span>').insertAfter('#txtFechaReserva');
                valido = false;
            }

            if ($('#txtFechaDevolucion').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese fecha de devolución</span>').insertAfter('#txtFechaDevolucion');
                valido = false;
            }

            if ($('#ddlEstado').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione estado</span>').insertAfter('#ddlEstado');
                valido = false;
            }

            if ($('#txtObservaciones').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese una observación</span>').insertAfter('#txtObservaciones');
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
