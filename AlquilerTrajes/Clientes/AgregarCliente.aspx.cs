using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
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

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("AgregarCliente", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        
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

                        // Después de guardar exitosamente
                        Response.Redirect("VerCliente.aspx?mensaje=Cliente+registrado+exitosamente");

                    }
                }
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al guardar: " + ex.Message;
            }
        }
    }
}
