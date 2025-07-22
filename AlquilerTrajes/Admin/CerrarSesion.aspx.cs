using System;

namespace AlquilerTrajes
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear(); // Elimina todas las variables de sesión
            Session.Abandon(); // Finaliza la sesión
            Response.Redirect("~/Login_Admin/LoginAdmin.aspx"); // Redirige al login
        }
    }
}
