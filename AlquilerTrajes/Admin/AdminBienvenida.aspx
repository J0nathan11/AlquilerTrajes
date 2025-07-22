<%@ Page Title="Bienvenido" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBienvenida.aspx.cs" Inherits="AlquilerTrajes.Admin.AdminBienvenida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mt-5">
        <h2 class="text-success">¡Bienvenido, <%= Session["admin_nombre"] %>!</h2>
        <p class="lead">Has iniciado sesión correctamente como administrador del sistema.</p>

        <!-- Imagen decorativa -->
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC7GzuPO-bep-WzS9jeVeDWcAatzB0jT42wg&s" class="img-fluid my-4" alt="Administrador" style="max-width: 150px;" />
        <br />
        <!-- Botón de acción -->
        <a href="GestionTrajes.aspx" class="btn btn-primary btn-lg">Ir al Panel de Gestión</a>
    </div>
    <br /><br /><br /><br /><br /><br />
</asp:Content>
