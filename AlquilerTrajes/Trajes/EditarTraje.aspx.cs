using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EditarTraje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEventos();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CargarTraje(id);
                }
            }
        }

        private void CargarEventos()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT id_evento, nombre_evento FROM eventos WHERE estado = 'activo'", con))
                {
                    con.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();
                    ddlEvento.DataSource = reader;
                    ddlEvento.DataTextField = "nombre_evento";
                    ddlEvento.DataValueField = "id_evento";
                    ddlEvento.DataBind();
                }
            }

            ddlEvento.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Seleccione --", ""));
        }

        private void CargarTraje(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM trajes WHERE id_traje = @id", con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtNombre.Text = reader["nombre_traje"].ToString();
                        ddlTalla.SelectedValue = reader["talla"].ToString();
                        txtDescripcion.Text = reader["descripcion"].ToString();
                        decimal precio = 0;
                        if (reader["precio_alquiler"] != DBNull.Value)
                        {
                            precio = Convert.ToDecimal(reader["precio_alquiler"]);
                        }
                        txtPrecio.Text = precio.ToString("F2", System.Globalization.CultureInfo.InvariantCulture);

                        txtStock.Text = reader["stock"].ToString();
                        ddlDisponible.SelectedValue = reader["disponible"].ToString();
                        ddlEvento.SelectedValue = reader["id_evento"].ToString();
                    }
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                lblMensaje.Text = "ID inválido.";
                return;
            }

            int idTraje = int.Parse(Request.QueryString["id"]);
            string nombre = txtNombre.Text.Trim();
            string talla = ddlTalla.SelectedValue;
            string descripcion = txtDescripcion.Text.Trim();
            string precioStr = txtPrecio.Text.Trim();
            string stockStr = txtStock.Text.Trim();
            string disponible = ddlDisponible.SelectedValue;
            string idEventoStr = ddlEvento.SelectedValue;
            string tipoEvento = ddlEvento.SelectedItem.Text;

            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(talla) ||
                string.IsNullOrWhiteSpace(descripcion) || string.IsNullOrWhiteSpace(precioStr) ||
                string.IsNullOrWhiteSpace(stockStr) || string.IsNullOrWhiteSpace(idEventoStr))
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            decimal precio = decimal.Parse(precioStr);
            int stock = int.Parse(stockStr);
            int idEvento = int.Parse(idEventoStr);

            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (MySqlConnection con = new MySqlConnection(cadena))
                {
                    using (MySqlCommand cmd = new MySqlCommand("ActualizarTraje", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@_id_traje", idTraje);
                        cmd.Parameters.AddWithValue("@_nombre_traje", nombre);
                        cmd.Parameters.AddWithValue("@_tipo_evento", tipoEvento);
                        cmd.Parameters.AddWithValue("@_talla", talla);
                        cmd.Parameters.AddWithValue("@_descripcion", descripcion);
                        cmd.Parameters.AddWithValue("@_precio_alquiler", precio);
                        cmd.Parameters.AddWithValue("@_stock", stock);
                        cmd.Parameters.AddWithValue("@_disponible", disponible);
                        cmd.Parameters.AddWithValue("@_id_evento", idEvento);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("VerTrajes.aspx?mensaje=Traje+actualizado+exitosamente");
            }
            catch (MySqlException ex)
            {
                lblMensaje.Text = "Error al actualizar: " + ex.Message;
            }
        }
    }
}
