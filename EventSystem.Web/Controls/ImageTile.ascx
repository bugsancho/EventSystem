<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageTile.ascx.cs" Inherits="EventSystem.Web.Controls.ImageTile" %>
<div class="col-md-3 image-tile">
    <asp:ImageButton ImageUrl="<%#: this.ImageUrl %>" id="image" runat="server" ViewStateMode="Enabled"  OnClick="ImageTile_Click"/>
    <p><%#: this.Info %></p>
</div>
