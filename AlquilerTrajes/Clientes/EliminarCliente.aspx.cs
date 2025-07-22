using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Clientes
{
    public partial class EliminarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                EliminarClientePorId(id);
            }

            // Redirige de vuelta al listado
            Response.Redirect("VerCliente.aspx?mensaje=Cliente+eliminado+correctamente");
        }

        private void EliminarClientePorId(int id)
        {
            string cadena = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(cadena))
            {
                using (MySqlCommand cmd = new MySqlCommand("EliminarCliente", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@_id_cliente", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
