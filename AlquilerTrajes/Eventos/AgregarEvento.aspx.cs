using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class AgregarEvento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreEvento.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            string estado = ddlEstado.SelectedValue;

            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(descripcion))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("AgregarEvento", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_nombre_evento", nombre);
                        cmd.Parameters.AddWithValue("@_descripcion", descripcion);
                        cmd.Parameters.AddWithValue("@_estado", estado);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Redirect("VerEvento.aspx?mensaje=Evento+registrado+exitosamente");
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
