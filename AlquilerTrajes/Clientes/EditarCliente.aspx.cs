using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EditarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                CargarCliente(id);
            }
        }

        private void CargarCliente(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                string query = "SELECT * FROM clientes WHERE id_cliente = @id";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                var reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfIdCliente.Value = reader["id_cliente"].ToString();
                    txtNombres.Text = reader["nombres"].ToString();
                    txtApellidos.Text = reader["apellidos"].ToString();
                    txtCedula.Text = reader["cedula"].ToString();
                    txtEmail.Text = reader["email"].ToString();
                    txtTelefono.Text = reader["telefono"].ToString();
                    txtContrasena.Attributes["value"] = reader["contrasena"].ToString();
                    txtDireccion.Text = reader["direccion"].ToString();
                    ddlEstado.SelectedValue = reader["estado"].ToString();
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hfIdCliente.Value);
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string cedula = txtCedula.Text.Trim();
            string email = txtEmail.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string estado = ddlEstado.SelectedValue;

            if (string.IsNullOrWhiteSpace(nombres) || string.IsNullOrWhiteSpace(apellidos) ||
                string.IsNullOrWhiteSpace(cedula) || string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(telefono) || string.IsNullOrWhiteSpace(contrasena) ||
                string.IsNullOrWhiteSpace(direccion))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("ActualizarCliente", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_id_cliente", id);
                    cmd.Parameters.AddWithValue("@_nombres", nombres);
                    cmd.Parameters.AddWithValue("@_apellidos", apellidos);
                    cmd.Parameters.AddWithValue("@_cedula", cedula);
                    cmd.Parameters.AddWithValue("@_email", email);
                    cmd.Parameters.AddWithValue("@_telefono", telefono);
                    cmd.Parameters.AddWithValue("@_contrasena", contrasena);
                    cmd.Parameters.AddWithValue("@_direccion", direccion);
                    cmd.Parameters.AddWithValue("@_estado", estado);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("VerCliente.aspx?mensaje=Cliente+actualizado+exitosamente");
                }
            }
        }
    }
}
