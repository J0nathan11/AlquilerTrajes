using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class AgregarPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarReservas();
        }

        private void CargarReservas()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                string query = @"
            SELECT r.id_reserva,
                   CONCAT('Reserva #', r.id_reserva, ' - ', c.nombres, ' ', c.apellidos, ' - ', c.cedula) AS descripcion
            FROM reservas r
            INNER JOIN clientes c ON r.id_cliente = c.id_cliente
            ORDER BY r.id_reserva DESC";

                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    con.Open();
                    ddlReserva.DataSource = cmd.ExecuteReader();
                    ddlReserva.DataTextField = "descripcion";
                    ddlReserva.DataValueField = "id_reserva";
                    ddlReserva.DataBind();
                }
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string idReservaStr = ddlReserva.SelectedValue;
            string montoStr = txtMonto.Text;
            string fechaPago = txtFechaPago.Text;
            string metodo = ddlMetodoPago.SelectedValue;
            string estado = ddlEstadoPago.SelectedValue;
            string referencia = txtReferencia.Text.Trim();

            if (string.IsNullOrWhiteSpace(idReservaStr) || string.IsNullOrWhiteSpace(montoStr) || string.IsNullOrWhiteSpace(fechaPago))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            int idReserva = int.Parse(idReservaStr);
            decimal monto = decimal.Parse(montoStr);
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("AgregarPago", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_id_reserva", idReserva);
                        cmd.Parameters.AddWithValue("@_monto_pagado", monto);
                        cmd.Parameters.AddWithValue("@_fecha_pago", fechaPago);
                        cmd.Parameters.AddWithValue("@_metodo_pago", metodo);
                        cmd.Parameters.AddWithValue("@_estado_pago", estado);
                        cmd.Parameters.AddWithValue("@_referencia_pago", referencia);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("VerPagos.aspx?mensaje=Pago+registrado+correctamente");
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al guardar: " + ex.Message;
            }
        }
    }
}
