<%@ Page Title="Listado de Trajes" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerTrajes.aspx.cs" Inherits="AlquilerTrajes.Admin.VerTrajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Listado de Trajes</h2>
    <br />
    <div class="text-center">
        <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
    </div>
    <br />
    <div class="text-center">
        <a href='<%= ResolveUrl("~/Trajes/AgregarTraje.aspx") %>' class="btn btn-outline-primary">
            <i class="fas fa-plus"></i> Agregar Traje
        </a>
    </div>
    <br />

    <asp:Repeater ID="rptTrajes" runat="server">
        <HeaderTemplate>
            <table id="tablaTrajes" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Tipo Evento</th>
                        <th>Talla</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Disponible</th>
                        <th>Evento</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("id_traje") %></td>
                <td><%# Eval("nombre_traje") %></td>
                <td><%# Eval("tipo_evento") %></td>
                <td><%# Eval("talla") %></td>
                <td><%# Eval("descripcion") %></td>
                <td>$<%# Eval("precio_alquiler", "{0:F2}") %></td>
                <td><%# Eval("stock") %></td>
                <td><%# Eval("disponible") %></td>
                <td><%# Eval("nombre_evento") %></td>
                <td>
                    <a href='EditarTraje.aspx?id=<%# Eval("id_traje") %>' class='btn btn-outline-warning btn-sm' title='Editar'>
                        <i class='fas fa-edit'></i>
                    </a>
                    <a href='EliminarTraje.aspx?id=<%# Eval("id_traje") %>' class='btn btn-outline-danger btn-sm'
                       onclick='return confirm("¿Estás seguro de eliminar este traje?");' title='Eliminar'>
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
            $('#tablaTrajes').DataTable();
        });

        setTimeout(function () {
            $(".alert").fadeOut("slow");
        }, 5000);
    </script>
</asp:Content>
