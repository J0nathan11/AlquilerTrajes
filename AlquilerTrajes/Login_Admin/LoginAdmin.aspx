<%@ Page Title="Login Administrador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="AlquilerTrajes.LoginAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container mt-5">
        <h2 class="text-center text-primary">Iniciar Sesión - Administrador</h2>
        <br />
        <div class="row justify-content-center">
            <div class="col-md-4">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                <asp:Panel runat="server" CssClass="card p-4 shadow">
                    <div class="form-group mb-3">
                        <label>Usuario:</label>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                    <div class="form-group mb-3">
                        <label>Contraseña:</label>
                        <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Iniciar Sesión" OnClientClick="return validarCampos();" OnClick="btnLogin_Click" />
                </asp:Panel>
            </div>
        </div>
    </main>

    <!-- Scripts jQuery y validación -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <script>
        function validarCampos() {
            var valido = true;
            $(".text-danger-validate").remove();

            if ($("#txtUsuario").val().trim() === "") {
                $("<span class='text-danger text-danger-validate'>Ingrese usuario</span>").insertAfter("#txtUsuario");
                valido = false;
            }

            if ($("#txtContrasena").val().trim() === "") {
                $("<span class='text-danger text-danger-validate'>Ingrese contraseña</span>").insertAfter("#txtContrasena");
                valido = false;
            }

            return valido;
        }
    </script>
</asp:Content>
