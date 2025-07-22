using System;
using System.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EditarReserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CargarReserva(id);
                }
                else
                {
                    CargarClientes(null);
                }
            }
        }

        private void CargarClientes(int? clienteActualId)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                string sql = "SELECT id_cliente, CONCAT(id_cliente, ' - ', nombres, ' ', apellidos) AS nombre_completo " +
                             "FROM clientes " +
                             "WHERE estado = 'activo'";

                if (clienteActualId != null)
                {
                    sql += " OR id_cliente = @id_actual";
                }

                using (MySqlCommand cmd = new MySqlCommand(sql, con))
                {
                    if (clienteActualId != null)
                    {
                        cmd.Parameters.AddWithValue("@id_actual", clienteActualId);
                    }

                    con.Open();
                    ddlCliente.DataSource = cmd.ExecuteReader();
                    ddlCliente.DataTextField = "nombre_completo";
                    ddlCliente.DataValueField = "id_cliente";
                    ddlCliente.DataBind();
                }
            }

            ddlCliente.Items.Insert(0, new ListItem("-- Seleccione --", ""));
        }

        private void CargarReserva(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            int idCliente = 0;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM reservas WHERE id_reserva = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            idCliente = Convert.ToInt32(reader["id_cliente"]);
                            txtFechaReserva.Text = Convert.ToDateTime(reader["fecha_reserva"]).ToString("yyyy-MM-dd");
                            txtFechaDevolucion.Text = Convert.ToDateTime(reader["fecha_devolucion"]).ToString("yyyy-MM-dd");
                            ddlEstado.SelectedValue = reader["estado"].ToString();
                            txtObservaciones.Text = reader["observaciones"].ToString();
                        }
                    }
                }
            }

            // Llamar a cargar clientes con el ID actual para asegurar que esté en el listado
            CargarClientes(idCliente);

            // Establecer el valor seleccionado
            ddlCliente.SelectedValue = idCliente.ToString();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                lblMensaje.Text = "ID de reserva inválido.";
                return;
            }

            int idReserva = int.Parse(Request.QueryString["id"]);
            int idCliente = int.Parse(ddlCliente.SelectedValue);
            DateTime fechaReserva = DateTime.Parse(txtFechaReserva.Text);
            DateTime fechaDevolucion = DateTime.Parse(txtFechaDevolucion.Text);
            string estado = ddlEstado.SelectedValue;
            string observaciones = txtObservaciones.Text.Trim();

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("ActualizarReserva", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_id_reserva", idReserva);
                        cmd.Parameters.AddWithValue("@_id_cliente", idCliente);
                        cmd.Parameters.AddWithValue("@_fecha_reserva", fechaReserva);
                        cmd.Parameters.AddWithValue("@_fecha_devolucion", fechaDevolucion);
                        cmd.Parameters.AddWithValue("@_estado", estado);
                        cmd.Parameters.AddWithValue("@_observaciones", observaciones);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("VerReservas.aspx?mensaje=Reserva+actualizada+correctamente");
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al actualizar: " + ex.Message;
            }
        }
    }
}
