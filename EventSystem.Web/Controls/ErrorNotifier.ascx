<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorNotifier.ascx.cs" Inherits="EventSystem.Web.Controls.ErrorNotifier" %>
<p class="alert alert-danger" id="errorBox" runat="server">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <%=this.ErrorMessageText %>"
</p>