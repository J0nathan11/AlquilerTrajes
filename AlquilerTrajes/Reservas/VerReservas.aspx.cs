using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class VerReservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mensaje"] != null)
                {
                    lblMensaje.Text = Request.QueryString["mensaje"];
                    lblMensaje.Visible = true;
                }

                CargarReservas();
            }
        }

        private void CargarReservas()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("ObtenerReservas", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptReservas.DataSource = dt;
                    rptReservas.DataBind();
                }
            }
        }
    }
}
