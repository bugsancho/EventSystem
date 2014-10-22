<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventSystem.Web.Account.Profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
      <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h1>My Account</h1>
                <hr />
                <dl class="dl-horizontal">

                    <dt>Username:</dt>
                    <dd><%: CurrentUser.UserName %>
                    
                    <dt>Full name:</dt>
                    <dd><%: CurrentUser.FirstName + " " + CurrentUser.LastName %>

                    <dt>Phone number:</dt>
                    <dd><%: CurrentUser.PhoneNumber%>

                    
                </dl>
            </div>
        </div>
    </div>
</asp:Content>
