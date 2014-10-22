<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageTile.ascx.cs" Inherits="EventSystem.Web.Controls.ImageTile" %>
<div class="col-md-3">
    <p><%#: this.Info %></p>
    <asp:ImageButton ImageUrl="<%#: this.ImageUrl %>" id="image" runat="server" width="200" height="200" ViewStateMode="Enabled"  OnClick="ImageTile_Click"/>
</div>
