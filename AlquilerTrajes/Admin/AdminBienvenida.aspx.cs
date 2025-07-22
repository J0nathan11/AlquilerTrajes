using System;
using System.Web;

namespace AlquilerTrajes.Admin
{
    public partial class AdminBienvenida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Validar si hay sesión activa del admin
            if (Session["admin_usuario"] == null)
            {
                Response.Redirect("~/Login_Admin/LoginAdmin.aspx");
            }
        }
    }
}
