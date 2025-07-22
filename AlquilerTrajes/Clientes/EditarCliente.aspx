<%@ Page Title="Editar Cliente" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditarCliente.aspx.cs" Inherits="AlquilerTrajes.Admin.EditarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-warning">Editar Cliente</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <asp:HiddenField ID="hfIdCliente" runat="server" />
                <div class="form-group mb-3">
                    <label>Nombres:</label>
                    <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>
                <div class="form-group mb-3">
                    <label>Apellidos:</label>
                    <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>
                <div class="form-group mb-3">
                    <label>Cédula:</label>
                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" ClientIDMode="Static" MaxLength="10" />
                </div>
                <div class="form-group mb-3">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Email" />
                </div>
                <div class="form-group mb-3">
                    <label>Teléfono:</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" ClientIDMode="Static" MaxLength="10" />
                </div>
                
                <div class="form-group mb-3">
                    <label>Contraseña:</label>
                    <div class="input-group">
                        <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Password" />
                        <span class="input-group-text">
                            <input type="checkbox" onclick="togglePassword()" />
                        </span>
                    </div>
                </div>


                <div class="form-group mb-3">
                    <label>Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>
                <div class="form-group mb-3">
                    <label>Estado:</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Activo" Value="activo" />
                        <asp:ListItem Text="Inactivo" Value="inactivo" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning w-100" Text="Actualizar Cliente" OnClientClick="return validarFormulario();" OnClick="btnActualizar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Clientes/VerCliente.aspx") %>' class="btn btn-secondary w-100">Regresar</a>
            </asp:Panel>
        </div>
    </div>

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

        $("#txtNombres, #txtApellidos").on("keypress", function (e) {
            var char = String.fromCharCode(e.which);
            if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]$/.test(char)) {
                e.preventDefault();
            }
        });

        $("#txtCedula, #txtTelefono").on("keypress", function (e) {
            var charCode = e.which ? e.which : e.keyCode;
            if (charCode < 48 || charCode > 57) {
                e.preventDefault();
            }
        });
    </script>

    <script>
        function togglePassword() {
            var campo = document.getElementById("txtContrasena");
            campo.type = campo.type === "password" ? "text" : "password";
        }
    </script>


</asp:Content>
