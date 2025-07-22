<%@ Page Title="Agregar Evento" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AgregarEvento.aspx.cs" Inherits="AlquilerTrajes.Admin.AgregarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Agregar Nuevo Evento</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Nombre del Evento:</label>
                    <asp:TextBox ID="txtNombreEvento" runat="server" CssClass="form-control" ClientIDMode="Static" Placeholder="Ingrese el nombre del evento" />
                </div>
                <div class="form-group mb-3">
                    <label>Descripción:</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" ClientIDMode="Static" Placeholder="Ingrese una descripción" />
                </div>
                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Activo" Value="activo" />
                        <asp:ListItem Text="Inactivo" Value="inactivo" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success w-100" Text="Guardar Evento" OnClientClick="return validarFormulario();" OnClick="btnGuardar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Eventos/VerEvento.aspx") %>' class="btn btn-secondary w-100">Regresar</a>
            </asp:Panel>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validarFormulario() {
            var valido = true;
            $(".text-danger-validate").remove();

            if ($('#txtNombreEvento').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese el nombre del evento</span>').insertAfter('#txtNombreEvento');
                valido = false;
            }
            if ($('#txtDescripcion').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese una descripción</span>').insertAfter('#txtDescripcion');
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
