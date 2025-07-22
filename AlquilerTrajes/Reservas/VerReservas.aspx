<%@ Page Title="Listado de Reservas" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerReservas.aspx.cs" Inherits="AlquilerTrajes.Admin.VerReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Listado de Reservas</h2>
    <br />
    <div class="text-center">
        <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
    </div>
    <br />
    <div class="text-center">
        <a href='<%= ResolveUrl("~/Reservas/AgregarReserva.aspx") %>' class="btn btn-outline-primary">
            <i class="fas fa-plus"></i> Agregar Reserva
        </a>
    </div>
    <br />

    <asp:Repeater ID="rptReservas" runat="server">
        <HeaderTemplate>
            <table id="tablaReservas" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Fecha Reserva</th>
                        <th>Fecha Devolución</th>
                        <th>Estado</th>
                        <th>Observaciones</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("id_reserva") %></td>
                <td><%# Eval("nombre_cliente") %></td>
                <td><%# Eval("fecha_reserva", "{0:yyyy-MM-dd}") %></td>
                <td><%# Eval("fecha_devolucion", "{0:yyyy-MM-dd}") %></td>
                <td><%# Eval("estado") %></td>
                <td><%# Eval("observaciones") %></td>
                <td>
                    <a href='EditarReserva.aspx?id=<%# Eval("id_reserva") %>' class='btn btn-outline-warning btn-sm' title='Editar'>
                        <i class='fas fa-edit'></i>
                    </a>
                    <a href='EliminarReserva.aspx?id=<%# Eval("id_reserva") %>' class='btn btn-outline-danger btn-sm'
                       onclick='return confirm("¿Estás seguro de eliminar esta reserva?");' title='Eliminar'>
                        <i class='fas fa-trash-alt'></i>
                    </a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
                </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="//cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tablaReservas').DataTable();
        });

        setTimeout(function () {
            $(".alert").fadeOut("slow");
        }, 5000);
    </script>
</asp:Content>
