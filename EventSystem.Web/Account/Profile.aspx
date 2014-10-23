<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventSystem.Web.Account.Profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
      <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h1>My Account</h1>
                <hr />
                <dl class="dl-horizontal">

                    <dt>Username:</dt>
                    <dd><%: LoggedUser.UserName %></dd>
                    
                    <dt>Full name:</dt>
                    <dd><%: LoggedUser.FirstName + " " + LoggedUser.LastName %></dd>

                    <dt>Phone number:</dt>
                    <dd><%: LoggedUser.PhoneNumber%></dd>

                    <dt>Profile Image:</dt>
                    <dd>
                        <img src="<%: LoggedUser.GetProfileImageOrDefault()%>" height="100" width ="100" />
                    </dd>

                    
                </dl>
            </div>
        </div>
    </div>
</asp:Content>
