<%@ Page Title="Reportes y KPIs" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="AlquilerTrajes.Admin.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-primary mb-4">Panel de Reportes y KPIs</h2>

    <!-- Tarjetas KPI Resumen -->
    <div class="row mb-4 text-center">
        <div class="col-md-3">
            <div class="card bg-success text-white shadow">
                <div class="card-body">
                    Clientes Activos<br />
                    <h3><%= kpiActivos %></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-danger text-white shadow">
                <div class="card-body">
                    Clientes Inactivos<br />
                    <h3><%= kpiInactivos %></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-primary text-white shadow">
                <div class="card-body">
                    Total Reservas<br />
                    <h3><%= kpiReservas %></h3>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-warning text-white shadow">
                <div class="card-body">
                    Total Pagos<br />
                    <h3><%= kpiPagos %></h3>
                </div>
            </div>
        </div>
    </div>

    <!-- Gráficos KPIs -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5 class="text-center">Clientes Activos vs Inactivos</h5>
                <canvas id="clientesActivosInactivosChart" height="250"></canvas>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-center">Trajes por Talla</h5>
                <canvas id="trajesPorTallaChart" height="250"></canvas>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-center">Trajes por Tipo de Evento</h5>
                <canvas id="trajesPorEventoChart" height="250"></canvas>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-center">Top 5 Trajes Más Caros</h5>
                <canvas id="topCarosChart" height="250"></canvas>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-center">Top 5 Trajes Más Baratos</h5>
                <canvas id="topBaratosChart" height="250"></canvas>
            </div>

            <div class="col-md-3 mb-4">
                <h5 class="text-center">Reservas por Estado</h5>
                <canvas id="reservasPorEstadoChart" height="250"></canvas>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-center">Pagos por Estado</h5>
                <canvas id="pagosPorEstadoChart" height="250"></canvas>
            </div>

            <div class="col-md-3 mb-4">
                <h5 class="text-center">Pagos por Método</h5>
                <canvas id="pagosPorMetodoChart" height="250"></canvas>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var kpiData = <%= kpiJson %>;

        new Chart(document.getElementById('clientesActivosInactivosChart'), {
            type: 'doughnut',
            data: {
                labels: ['Activos', 'Inactivos'],
                datasets: [{
                    data: [kpiData.clientes_activos, kpiData.clientes_inactivos],
                    backgroundColor: ['#4CAF50', '#F44336']
                }]
            }
        });

        new Chart(document.getElementById('trajesPorTallaChart'), {
            type: 'bar',
            data: {
                labels: kpiData.trajes_por_talla.map(x => x.talla),
                datasets: [{
                    label: 'Total',
                    data: kpiData.trajes_por_talla.map(x => x.total),
                    backgroundColor: '#2196F3'
                }]
            }
        });

        new Chart(document.getElementById('trajesPorEventoChart'), {
            type: 'bar',
            data: {
                labels: kpiData.trajes_por_evento.map(x => x.evento),
                datasets: [{
                    label: 'Total Trajes',
                    data: kpiData.trajes_por_evento.map(x => x.total),
                    backgroundColor: '#FF9800'
                }]
            }
        });

        new Chart(document.getElementById('topCarosChart'), {
            type: 'bar',
            data: {
                labels: kpiData.trajes_caros.map(x => x.nombre),
                datasets: [{
                    label: 'Precio $',
                    data: kpiData.trajes_caros.map(x => x.precio),
                    backgroundColor: '#E91E63'
                }]
            }
        });

        new Chart(document.getElementById('topBaratosChart'), {
            type: 'bar',
            data: {
                labels: kpiData.trajes_baratos.map(x => x.nombre),
                datasets: [{
                    label: 'Precio $',
                    data: kpiData.trajes_baratos.map(x => x.precio),
                    backgroundColor: '#00BCD4'
                }]
            }
        });

        new Chart(document.getElementById('reservasPorEstadoChart'), {
            type: 'pie',
            data: {
                labels: kpiData.reservas_estado.map(x => x.estado),
                datasets: [{
                    data: kpiData.reservas_estado.map(x => x.total),
                    backgroundColor: ['#3F51B5', '#009688', '#FF5722', '#795548']
                }]
            }
        });

        new Chart(document.getElementById('pagosPorEstadoChart'), {
            type: 'bar',
            data: {
                labels: kpiData.pagos_estado.map(x => x.estado),
                datasets: [{
                    label: 'Total',
                    data: kpiData.pagos_estado.map(x => x.total),
                    backgroundColor: '#673AB7'
                }]
            }
        });

        new Chart(document.getElementById('pagosPorMetodoChart'), {
            type: 'doughnut',
            data: {
                labels: kpiData.pagos_metodo.map(x => x.metodo),
                datasets: [{
                    data: kpiData.pagos_metodo.map(x => x.total),
                    backgroundColor: ['#009688', '#FFC107', '#CDDC39']
                }]
            }
        });
    </script>
</asp:Content>
