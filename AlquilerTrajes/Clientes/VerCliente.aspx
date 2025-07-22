<%@ Page Title="Listado de Clientes" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerCliente.aspx.cs" Inherits="AlquilerTrajes.Admin.VerCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Listado de Clientes</h2>
    <br />
    <div class="text-center">
        <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
    </div>
    <br />
    <div class="text-center">
        <a href='<%= ResolveUrl("~/Clientes/AgregarCliente.aspx") %>' class="btn btn-outline-primary">
            <i class="fas fa-plus"></i> Agregar Cliente
        </a>
    </div>
    <br />

    <!-- ✅ Label para mostrar mensaje -->
    <div class="text-center">
        <asp:Label ID="Label1" runat="server" CssClass="alert alert-success text-center w-100" Visible="false"></asp:Label>
    </div>

    <br />
    <asp:Repeater ID="rptClientes" runat="server">
        <HeaderTemplate>
            <table id="tablaClientes" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Cédula</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
                    <tr>
                        <td><%# Eval("id_cliente") %></td>
                        <td><%# Eval("nombre_completo") %></td>
                        <td><%# Eval("cedula") %></td>
                        <td><%# Eval("email") %></td>
                        <td><%# Eval("telefono") %></td>
                        <td><%# Eval("direccion") %></td>
                        <td><%# Eval("estado") %></td>
                        <td>
                            <a href='EditarCliente.aspx?id=<%# Eval("id_cliente") %>' class='btn btn-outline-warning btn-sm' title='Editar'>
                                <i class='fas fa-edit'></i>
                            </a>
                            <a href='EliminarCliente.aspx?id=<%# Eval("id_cliente") %>' class='btn btn-outline-danger btn-sm' 
                               onclick='return confirm("¿Estás seguro de eliminar este cliente?");' title='Eliminar'>
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
            $('#tablaClientes').DataTable();
        });

        setTimeout(function () {
            var msg = document.querySelector(".alert");
            if (msg) {
                msg.style.display = "none";
            }
        }, 5000);
    </script>
    <script>
        setTimeout(function () {
            $(".alert").fadeOut("slow");
        }, 5000);
    </script>

</asp:Content>
