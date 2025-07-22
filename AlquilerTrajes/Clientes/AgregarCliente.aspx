<%@ Page Title="Agregar Cliente" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="AlquilerTrajes.Admin.AgregarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary">Agregar Nuevo Cliente</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Nombres:</label>
                    <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" ClientIDMode="Static" Placeholder="Ingrese el nombre del cliente" />
                </div>
                <div class="form-group mb-3">
                    <label>Apellidos:</label>
                    <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" ClientIDMode="Static" Placeholder="Ingrese el apellido del cliente" />
                </div>
                <div class="form-group mb-3">
                    <label>Cédula:</label>
                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" ClientIDMode="Static" MaxLength="10" Placeholder="Ingrese el número de cédula" />
                </div>
                <div class="form-group mb-3">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Email" Placeholder="Ingrese un correo electrónico" />
                </div>
                <div class="form-group mb-3">
                    <label>Teléfono:</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" ClientIDMode="Static" MaxLength="10" Placeholder="Ingrese el númnero de teléfono " />
                </div>
                <div class="form-group mb-3">
                    <label>Contraseña:</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Password" Placeholder="Ingrese una contraseña" />
                </div>
                <div class="form-group mb-3">
                    <label>Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" ClientIDMode="Static" Placeholder="Ingrese una direción" />
                </div>
                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Activo" Value="activo" />
                        <asp:ListItem Text="Inactivo" Value="inactivo" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success w-100" Text="Guardar Cliente" OnClientClick="return validarFormulario();" OnClick="btnGuardar_Click" />
                <br />
                <!-- Botón Regresar -->
                <a href='<%= ResolveUrl("~/Clientes/VerCliente.aspx") %>' class="btn btn-secondary w-100">
                     Regresar
                </a>
            </asp:Panel>
        </div>
    </div>

    <!-- Scripts jQuery y validación -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function validarFormulario() {
            var valido = true;
            $(".text-danger-validate").remove();

            if ($('#txtNombres').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese nombres</span>').insertAfter('#txtNombres');
                valido = false;
            }
            if ($('#txtApellidos').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese apellidos</span>').insertAfter('#txtApellidos');
                valido = false;
            }
            if ($('#txtCedula').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese cédula</span>').insertAfter('#txtCedula');
                valido = false;
            }
            if ($('#txtEmail').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese email</span>').insertAfter('#txtEmail');
                valido = false;
            }
            if ($('#txtTelefono').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese teléfono</span>').insertAfter('#txtTelefono');
                valido = false;
            }
            if ($('#txtContrasena').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese contraseña</span>').insertAfter('#txtContrasena');
                valido = false;
            }
            if ($('#txtDireccion').val().trim() === '') {
                $('<span class="text-danger text-danger-validate">Ingrese dirección</span>').insertAfter('#txtDireccion');
                valido = false;
            }

            return valido;
        }
    </script>
    <script>

        $("#txtNombres").on("keypress", function (e) {
            var char = String.fromCharCode(e.which);
            if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]$/.test(char)) {
                e.preventDefault();
            }
        });

        $("#txtApellidos").on("keypress", function (e) {
            var char = String.fromCharCode(e.which);
            if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]$/.test(char)) {
                e.preventDefault();
            }
        });

        $("#txtCedula").on("keypress", function (e) {
            var charCode = e.which ? e.which : e.keyCode;
            if (charCode < 48 || charCode > 57) {
                e.preventDefault();
            }
        });

        $("#txtTelefono").on("keypress", function (e) {
            var charCode = e.which ? e.which : e.keyCode;
            if (charCode < 48 || charCode > 57) {
                e.preventDefault();
            }
        });


    </script>
    <br />
</asp:Content>
