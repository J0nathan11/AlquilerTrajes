using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class AgregarReserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarClientes();
        }

        private void CargarClientes()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id_cliente, CONCAT(id_cliente, ' - ', nombres, ' ', apellidos) AS nombre_completo FROM clientes WHERE estado = 'activo'", con))
                {
                    con.Open();
                    ddlCliente.DataSource = cmd.ExecuteReader();
                    ddlCliente.DataTextField = "nombre_completo"; // Muestra: 5 - Juan Pérez
                    ddlCliente.DataValueField = "id_cliente";
                    ddlCliente.DataBind();
                }
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string idClienteStr = ddlCliente.SelectedValue;
            string fechaReserva = txtFechaReserva.Text;
            string fechaDevolucion = txtFechaDevolucion.Text;
            string estado = ddlEstado.SelectedValue;
            string observaciones = txtObservaciones.Text.Trim();

            if (string.IsNullOrWhiteSpace(idClienteStr) || string.IsNullOrWhiteSpace(fechaReserva) || string.IsNullOrWhiteSpace(fechaDevolucion))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            int idCliente = int.Parse(idClienteStr);
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("AgregarReserva", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_id_cliente", idCliente);
                        cmd.Parameters.AddWithValue("@_fecha_reserva", fechaReserva);
                        cmd.Parameters.AddWithValue("@_fecha_devolucion", fechaDevolucion);
                        cmd.Parameters.AddWithValue("@_estado", estado);
                        cmd.Parameters.AddWithValue("@_observaciones", observaciones);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("VerReservas.aspx?mensaje=Reserva+registrada+exitosamente");
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al guardar: " + ex.Message;
            }
        }
    }
}
