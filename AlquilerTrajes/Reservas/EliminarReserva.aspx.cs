using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class EliminarReserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                EliminarReservaPorId(id);
            }

            // Redireccionar después de eliminar
            Response.Redirect("VerReservas.aspx?mensaje=Reserva+eliminada+correctamente");
        }

        private void EliminarReservaPorId(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("EliminarReserva", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_id_reserva", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
