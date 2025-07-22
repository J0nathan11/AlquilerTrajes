using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace AlquilerTrajes.Admin
{
    public partial class VerEvento : System.Web.UI.Page
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

                CargarEventos();
            }
        }

        private void CargarEventos()
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("ObtenerEventos", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptEventos.DataSource = dt;
                    rptEventos.DataBind();
                }
            }
        }
    }
}
