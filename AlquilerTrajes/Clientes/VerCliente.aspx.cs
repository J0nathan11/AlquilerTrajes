using System;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace AlquilerTrajes.Admin
{
    public partial class VerCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Mostrar mensaje si viene desde AgregarCliente.aspx
                if (Request.QueryString["mensaje"] != null)
                {
                    lblMensaje.Text = Request.QueryString["mensaje"];
                    lblMensaje.Visible = true;
                }

                CargarClientes();
            }
        }

        private void CargarClientes()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("ObtenerClientes", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptClientes.DataSource = dt;
                    rptClientes.DataBind();
                }
            }
        }
    }
}
