<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EventSystem.Web._Default" %>
<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/Controls/ImageTile.ascx" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center">
        <h1>Ticket System</h1>
    </div>
     <div class="container">
        <asp:Repeater ID="EventImagesContainer" runat="server" ItemType="EventSystem.Models.Venue"  ViewStateMode="Enabled" SelectMethod="EventImagesContainer_GetData">
            <ItemTemplate>
                <My:UserInfoBoxControl runat="server" Target='<%# "~/Venues?id="+Item.Id %>' Info='<%# ""+Item.Name %>' ImageUrl="<%#:Item.ImageUrl %>" ID="MyUserInfoBoxControl" />
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
