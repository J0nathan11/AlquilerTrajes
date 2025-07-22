using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.Script.Serialization;
using MySql.Data.MySqlClient;

namespace AlquilerTrajes.Admin
{
    public partial class Reportes : System.Web.UI.Page
    {
        // Variables públicas para las tarjetas KPI
        protected string kpiJson;
        protected string kpiActivos, kpiInactivos, kpiReservas, kpiPagos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Consultas individuales para las tarjetas
                int activos = ObtenerValorEscalar("SELECT COUNT(*) FROM clientes WHERE estado = 'activo'");
                int inactivos = ObtenerValorEscalar("SELECT COUNT(*) FROM clientes WHERE estado = 'inactivo'");
                int reservas = ObtenerValorEscalar("SELECT COUNT(*) FROM reservas");
                int pagos = ObtenerValorEscalar("SELECT COUNT(*) FROM pagos");

                // Asignación para mostrar en las tarjetas
                kpiActivos = activos.ToString();
                kpiInactivos = inactivos.ToString();
                kpiReservas = reservas.ToString();
                kpiPagos = pagos.ToString();

                // Reunir todos los datos para los gráficos
                var datos = new
                {
                    clientes_activos = activos,
                    clientes_inactivos = inactivos,
                    total_reservas = reservas,
                    trajes_por_talla = ObtenerLista("SELECT talla, COUNT(*) AS total FROM trajes GROUP BY talla ORDER BY talla", "talla", "total"),
                    trajes_por_evento = ObtenerLista("SELECT e.nombre_evento AS evento, COUNT(t.id_traje) AS total FROM trajes t JOIN eventos e ON t.id_evento = e.id_evento GROUP BY e.nombre_evento ORDER BY total DESC", "evento", "total"),
                    trajes_caros = ObtenerLista("SELECT nombre_traje AS nombre, precio_alquiler AS precio FROM trajes ORDER BY precio_alquiler DESC LIMIT 5", "nombre", "precio"),
                    trajes_baratos = ObtenerLista("SELECT nombre_traje AS nombre, precio_alquiler AS precio FROM trajes ORDER BY precio_alquiler ASC LIMIT 5", "nombre", "precio"),
                    reservas_estado = ObtenerLista("SELECT estado, COUNT(*) AS total FROM reservas GROUP BY estado ORDER BY total DESC", "estado", "total"),
                    pagos_estado = ObtenerLista("SELECT estado_pago AS estado, COUNT(*) AS total FROM pagos GROUP BY estado_pago ORDER BY total DESC", "estado", "total"),
                    pagos_metodo = ObtenerLista("SELECT metodo_pago AS metodo, COUNT(*) AS total FROM pagos GROUP BY metodo_pago ORDER BY total DESC", "metodo", "total")
                };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                kpiJson = serializer.Serialize(datos);
            }
        }

        private int ObtenerValorEscalar(string query)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(connStr))
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        private List<Dictionary<string, object>> ObtenerLista(string query, string keyField, string valueField)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            List<Dictionary<string, object>> lista = new List<Dictionary<string, object>>();

            using (MySqlConnection con = new MySqlConnection(connStr))
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                con.Open();
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var item = new Dictionary<string, object>();
                        item[keyField] = reader[keyField].ToString();
                        item[valueField] = reader[valueField];
                        lista.Add(item);
                    }
                }
            }

            return lista;
        }
    }
}
