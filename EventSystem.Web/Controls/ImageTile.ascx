<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageTile.ascx.cs" Inherits="EventSystem.Web.Controls.ImageTile" %>
<div class="col-md-6 image-tile">
    <asp:ImageButton ImageUrl="<%#: this.ImageUrl %>" id="image" runat="server" ViewStateMode="Enabled"  OnClick="ImageTile_Click"/>
    <div>
        <p><%#: this.Info %></p>
        <p><%#: this.AdditionalInfo %></p>
    </div>
</div>

