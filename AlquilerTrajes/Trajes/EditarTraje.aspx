<%@ Page Title="Editar Traje" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditarTraje.aspx.cs" Inherits="AlquilerTrajes.Admin.EditarTraje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center text-warning">Editar Traje</h2>
    <br />
    <div class="row justify-content-center">
        <div class="col-md-6">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" />
            <asp:Panel runat="server" CssClass="card p-4 shadow">
                <div class="form-group mb-3">
                    <label>Nombre del Traje:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ClientIDMode="Static" />
                </div>

                <div class="form-group mb-3">
                    <label>Tipo de Evento:</label>
                    <asp:DropDownList ID="ddlEvento" runat="server" CssClass="form-control" AppendDataBoundItems="true" />
                </div>

                <div class="form-group mb-3">
                    <label>Talla:</label>
                    <asp:DropDownList ID="ddlTalla" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="S" Value="S" />
                        <asp:ListItem Text="M" Value="M" />
                        <asp:ListItem Text="L" Value="L" />
                        <asp:ListItem Text="XL" Value="XL" />
                    </asp:DropDownList>
                </div>

                <div class="form-group mb-3">
                    <label>Descripción:</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" ClientIDMode="Static" />
                </div>
                <div class="form-group mb-3">
                    <label>Precio de Alquiler:</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Number" />
                </div>
                <div class="form-group mb-3">
                    <label>Stock:</label>
                    <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Number" />
                </div>
                <div class="form-group mb-3">
                    <label>Disponible:</label>
                    <asp:DropDownList ID="ddlDisponible" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Sí" Value="si" />
                        <asp:ListItem Text="No" Value="no" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-warning w-100" Text="Actualizar Traje" OnClick="btnActualizar_Click" />
                <br />
                <a href='<%= ResolveUrl("~/Trajes/VerTrajes.aspx") %>' class="btn btn-secondary w-100 mt-2">Cancelar</a>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
