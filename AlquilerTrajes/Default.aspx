<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AlquilerTrajes._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container mt-5">
        <section class="text-center mb-5">
            <h1 class="display-4 text-primary">Bienvenido a Alquiler de Trajes</h1>
            <p class="lead">Encuentra el traje perfecto para cada ocasión: bodas, graduaciones, fiestas y más.</p>
        </section>

        <div class="row text-center">
            <section class="col-md-4 mb-4">
                <img src="https://cdn0.bodas.net/vendor/52258/3_2/640/jpg/tienda-m3-chaque-i_1_52258-157839210572280.jpeg" class="img-fluid rounded shadow" alt="Trajes Elegantes">
                <h3 class="mt-3">Trajes Elegantes</h3>
                <p>Alquila trajes de etiqueta, esmóquines y trajes formales para eventos especiales.</p>
            </section>

            <section class="col-md-4 mb-4">
                <img src="https://cdn0.casamientos.com.ar/vendor/5885/3_2/960/jpg/20171003-105813_7_105885.jpeg" class="img-fluid rounded shadow" alt="Variedad de Estilos">
                <h3 class="mt-3">Variedad de Estilos</h3>
                <p>Disponemos de una gran variedad de colores, tallas y estilos modernos y clásicos.</p>
            </section>

            <section class="col-md-4 mb-4">
                <img src="https://cdn0.casamientos.com.ar/vendor/5885/3_2/960/jpg/44758683-10215969450083826-8492480809096183808-n_7_105885-162636060273740.jpeg" class="img-fluid rounded shadow" alt="Reserva Fácil">
                <h3 class="mt-3">Reserva Fácil</h3>
                <p>Agenda tu alquiler en línea, rápido y seguro. ¡Tu traje ideal te espera!</p>
            </section>
        </div>
        <section class="text-center mb-5">
            <p><a href="Catalogo.aspx" class="btn btn-lg btn-success">Iniciar como Cliente &raquo;</a></p>
        </section>
    </main>
</asp:Content>
