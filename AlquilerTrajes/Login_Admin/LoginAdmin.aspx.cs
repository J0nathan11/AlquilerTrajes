using System;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data.SqlClient;

namespace AlquilerTrajes
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                con.Open();
                string query = "SELECT * FROM administrador WHERE usuario = @usuario AND contrasena = @contrasena AND estado = 'activo'";

                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@usuario", usuario);
                cmd.Parameters.AddWithValue("@contrasena", contrasena); // Si usas hash, deberías validar con hash aquí

                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Guardar datos en sesión si deseas
                    Session["admin_usuario"] = reader["usuario"].ToString();
                    Session["admin_nombre"] = reader["nombres"].ToString();

                    Response.Redirect("~/Admin/AdminBienvenida.aspx");

                }
                else
                {
                    lblMensaje.Text = "Usuario o contraseña incorrectos, o cuenta inactiva.";
                }
            }
        }
    }
}
