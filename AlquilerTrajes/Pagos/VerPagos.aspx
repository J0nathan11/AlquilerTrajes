<%@ Page Title="Listado de Pagos" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerPagos.aspx.cs" Inherits="AlquilerTrajes.Admin.VerPagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Listado de Pagos</h2>
    <br />
    <div class="text-center">
        <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
    </div>
    <br />
    <div class="text-center">
        <a href='<%= ResolveUrl("~/Pagos/AgregarPago.aspx") %>' class="btn btn-outline-primary">
            <i class="fas fa-plus"></i> Agregar Pago
        </a>
    </div>
    <br />

    <asp:Repeater ID="rptPagos" runat="server">
        <HeaderTemplate>
            <table id="tablaPagos" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Reserva</th>
                        <th>Cliente</th>
                        <th>Monto</th>
                        <th>Fecha</th>
                        <th>Método</th>
                        <th>Estado</th>
                        <th>Referencia</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("id_pago") %></td>
                <td><%# Eval("id_reserva") %></td>
                <td><%# Eval("nombre_cliente") %></td>
                <td>$<%# Eval("monto_pagado", "{0:F2}") %></td>
                <td><%# Eval("fecha_pago", "{0:yyyy-MM-dd}") %></td>
                <td><%# Eval("metodo_pago") %></td>
                <td><%# Eval("estado_pago") %></td>
                <td><%# Eval("referencia_pago") %></td>
                <td>
                    <a href='EditarPago.aspx?id=<%# Eval("id_pago") %>' class='btn btn-outline-warning btn-sm' title='Editar'>
                        <i class='fas fa-edit'></i>
                    </a>
                    <a href='EliminarPago.aspx?id=<%# Eval("id_pago") %>' class='btn btn-outline-danger btn-sm'
                       onclick='return confirm("¿Estás seguro de eliminar este pago?");' title='Eliminar'>
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
            $('#tablaPagos').DataTable();
        });

        setTimeout(function () {
            $(".alert").fadeOut("slow");
        }, 5000);
    </script>
</asp:Content>
