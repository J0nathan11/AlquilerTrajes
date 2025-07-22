<%@ Page Title="Editar Evento" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditarEvento.aspx.cs" Inherits="AlquilerTrajes.Admin.EditarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-warning">Editar Evento</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <asp:HiddenField ID="hfIdEvento" runat="server" />
                
                <div class="form-group mb-3">
                    <label>Nombre del Evento:</label>
                    <asp:TextBox ID="txtNombreEvento" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Descripción:</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Activo" Value="activo" />
                        <asp:ListItem Text="Inactivo" Value="inactivo" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning w-100" Text="Actualizar Evento" OnClientClick="return validarFormulario();" OnClick="btnActualizar_Click" />
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
                $('<span class="text-danger text-danger-validate">Ingrese nombre del evento</span>').insertAfter('#txtNombreEvento');
                valido = false;
            }

            if ($('#txtDescripcion').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese descripción</span>').insertAfter('#txtDescripcion');
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
