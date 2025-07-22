<%@ Page Title="Listado de Eventos" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerEvento.aspx.cs" Inherits="AlquilerTrajes.Admin.VerEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Listado de Eventos</h2>
    <br />
    <div class="text-center">
        <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
    </div>
    <br />
    <div class="text-center">
        <a href='<%= ResolveUrl("~/Eventos/AgregarEvento.aspx") %>' class="btn btn-outline-primary">
            <i class="fas fa-plus"></i> Agregar Evento
        </a>
    </div>
    <br />

    <asp:Repeater ID="rptEventos" runat="server">
        <HeaderTemplate>
            <table id="tablaEventos" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
                    <tr>
                        <td><%# Eval("id_evento") %></td>
                        <td><%# Eval("nombre_evento") %></td>
                        <td><%# Eval("descripcion") %></td>
                        <td><%# Eval("estado") %></td>
                        <td>
                            <a href='EditarEvento.aspx?id=<%# Eval("id_evento") %>' class='btn btn-outline-warning btn-sm' title='Editar'>
                                <i class='fas fa-edit'></i>
                            </a>
                            <a href='EliminarEvento.aspx?id=<%# Eval("id_evento") %>' class='btn btn-outline-danger btn-sm' 
                               onclick='return confirm("¿Estás seguro de eliminar este evento?");' title='Eliminar'>
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
            $('#tablaEventos').DataTable();
        });

        setTimeout(function () {
            $(".alert").fadeOut("slow");
        }, 5000);
    </script>
</asp:Content>
