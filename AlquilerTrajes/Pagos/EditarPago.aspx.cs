using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EditarPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarReservas();
                CargarPago();
            }
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

        private void CargarPago()
        {
            string idPago = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idPago)) return;

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                string query = "SELECT * FROM pagos WHERE id_pago = @id_pago";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id_pago", idPago);
                    con.Open();

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Cargar ID reserva
                            ddlReserva.SelectedValue = reader["id_reserva"].ToString();

                            // Aquí estaba el error: no usar Convert.ToDecimal directo con TextMode="Number"
                            if (!reader.IsDBNull(reader.GetOrdinal("monto_pagado")))
                            {
                                txtMonto.Text = reader.GetDecimal(reader.GetOrdinal("monto_pagado")).ToString("0.00");
                            }

                            txtFechaPago.Text = Convert.ToDateTime(reader["fecha_pago"]).ToString("yyyy-MM-dd");
                            ddlMetodoPago.SelectedValue = reader["metodo_pago"].ToString().ToLower();
                            ddlEstadoPago.SelectedValue = reader["estado_pago"].ToString().ToLower();
                            txtReferencia.Text = reader["referencia_pago"].ToString();
                        }
                        else
                        {
                            lblMensaje.Text = "Pago no encontrado.";
                        }
                    }
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string idPago = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idPago)) return;

            string montoStr = txtMonto.Text.Trim();
            string fechaPago = txtFechaPago.Text.Trim();
            string metodo = ddlMetodoPago.SelectedValue;
            string estado = ddlEstadoPago.SelectedValue;
            string referencia = txtReferencia.Text.Trim();

            if (string.IsNullOrWhiteSpace(montoStr) || string.IsNullOrWhiteSpace(fechaPago))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            decimal monto;
            if (!decimal.TryParse(montoStr, out monto))
            {
                lblMensaje.Text = "Monto no válido.";
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("ActualizarPago", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_id_pago", idPago);
                        cmd.Parameters.AddWithValue("@_monto_pagado", monto);
                        cmd.Parameters.AddWithValue("@_fecha_pago", fechaPago);
                        cmd.Parameters.AddWithValue("@_metodo_pago", metodo);
                        cmd.Parameters.AddWithValue("@_estado_pago", estado);
                        cmd.Parameters.AddWithValue("@_referencia_pago", referencia);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("VerPagos.aspx?mensaje=Pago+actualizado+correctamente");
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al actualizar: " + ex.Message;
            }
        }
    }
}
