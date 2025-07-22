using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EditarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                CargarEvento(id);
            }
        }

        private void CargarEvento(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                string query = "SELECT * FROM eventos WHERE id_evento = @id";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                var reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfIdEvento.Value = reader["id_evento"].ToString();
                    txtNombreEvento.Text = reader["nombre_evento"].ToString();
                    txtDescripcion.Text = reader["descripcion"].ToString();
                    ddlEstado.SelectedValue = reader["estado"].ToString();
                }
                con.Close();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hfIdEvento.Value);
            string nombre = txtNombreEvento.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            string estado = ddlEstado.SelectedValue;

            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(descripcion))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("ActualizarEvento", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_id_evento", id);
                    cmd.Parameters.AddWithValue("@_nombre_evento", nombre);
                    cmd.Parameters.AddWithValue("@_descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@_estado", estado);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("VerEvento.aspx?mensaje=Evento+actualizado+correctamente");
                }
            }
        }
    }
}
