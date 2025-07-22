<%@ Page Title="Editar Reserva" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditarReserva.aspx.cs" Inherits="AlquilerTrajes.Admin.EditarReserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-warning">Editar Reserva</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                
                <div class="form-group mb-3">
                    <label>Cliente:</label>
                    <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Reserva:</label>
                    <asp:TextBox ID="txtFechaReserva" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="form-group mb-3">
                    <label>Fecha de Devolución:</label>
                    <asp:TextBox ID="txtFechaDevolucion" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                         <asp:ListItem Text="cancelada" Value="cancelada" />
                         <asp:ListItem Text="finalizada" Value="finalizada" />
                         <asp:ListItem Text="confirmada" Value="confirmada" />
                         <asp:ListItem Text="pendiente" Value="pendiente" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Observaciones:</label>
                    <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                </div>

                <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning w-100" Text="Actualizar Reserva" OnClick="btnActualizar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Reservas/VerReservas.aspx") %>' class="btn btn-secondary w-100 mt-2">Cancelar</a>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
