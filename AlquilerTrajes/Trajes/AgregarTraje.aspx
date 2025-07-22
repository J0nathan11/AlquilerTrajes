<%@ Page Title="Agregar Traje" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AgregarTraje.aspx.cs" Inherits="AlquilerTrajes.Admin.AgregarTraje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Agregar Nuevo Traje</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Nombre del Traje:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ClientIDMode="Static" Placeholder="Ingrese nombre del traje" />
                </div>

                <div class="form-group mb-3">
                    <label>Tipo de Evento:</label>
                    <asp:DropDownList ID="ddlEvento" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Talla:</label>
                    <asp:DropDownList ID="ddlTalla" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="S" Value="S" />
                        <asp:ListItem Text="M" Value="M" />
                        <asp:ListItem Text="L" Value="L" />
                        <asp:ListItem Text="XL" Value="XL" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Descripción:</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" ClientIDMode="Static" Placeholder="Ingrese una descripción" />
                </div>
                <div class="form-group mb-3">
                    <label>Precio de Alquiler:</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Number" Placeholder="Ingrese el precio" />
                </div>
                <div class="form-group mb-3">
                    <label>Stock:</label>
                    <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Number" Placeholder="Ingrese el stock" />
                </div>
                <div class="form-group mb-3">
                    <label>Disponible:</label>
                    <asp:DropDownList ID="ddlDisponible" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Sí" Value="si" />
                        <asp:ListItem Text="No" Value="no" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success w-100" Text="Guardar Traje" OnClientClick="return validarFormulario();" OnClick="btnGuardar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Trajes/VerTrajes.aspx") %>' class="btn btn-secondary w-100">Regresar</a>
            </asp:Panel>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validarFormulario() {
            let valido = true;
            $(".text-danger-validate").remove();

            if ($('#txtNombre').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese nombre</span>').insertAfter('#txtNombre');
                valido = false;
            }
            if ($('#ddlEvento').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Seleccione evento</span>').insertAfter('#ddlEvento');
                valido = false;
            }
            if ($('#txtTalla').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese talla</span>').insertAfter('#txtTalla');
                valido = false;
            }
            if ($('#txtDescripcion').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese descripción</span>').insertAfter('#txtDescripcion');
                valido = false;
            }
            if ($('#txtPrecio').val().trim() === '' || isNaN($('#txtPrecio').val())) {
                $('<span class="text-danger text-danger-validate">Ingrese precio válido</span>').insertAfter('#txtPrecio');
                valido = false;
            }
            if ($('#txtStock').val().trim() === '' || isNaN($('#txtStock').val())) {
                $('<span class="text-danger text-danger-validate">Ingrese stock válido</span>').insertAfter('#txtStock');
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
