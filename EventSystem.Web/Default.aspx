<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EventSystem.Web._Default" %>
<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/Controls/ImageTile.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center">
        <h1>Ticket System</h1>
    </div>
    <div class="container row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Events</h3>
                </div>
                <div class="panel-body">
                    <asp:Repeater ID="Repeater1" runat="server" ItemType="EventSystem.Models.Event"  ViewStateMode="Enabled" SelectMethod="EventImagesContainer_GetData">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <My:UserInfoBoxControl runat="server" 
                                                       Target='<%# "~/Event/EventDetails?id="+Item.Id %>' 
                                                       Info='<%# ""+Item.Title %>' 
                                                       ImageUrl='<%#:Item.ImageUrl %>' 
                                                       AdditionalInfo='<%#: Item.StartDate.ToString("dd-MM-yyyy") %>' 
                                                       ID="MyUserInfoBoxControl" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Venues</h3>
                </div>
                <div class="panel-body">
                    <asp:Repeater ID="EventImagesContainer" runat="server" ItemType="EventSystem.Models.Venue"  ViewStateMode="Enabled" SelectMethod="VenueImagesContainer_GetData">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <My:UserInfoBoxControl runat="server" Target='<%# "~/Venues/VenueDetails?id="+Item.Id %>' Info='<%# ""+Item.Name %>' ImageUrl="<%#:Item.ImageUrl %>" ID="MyUserInfoBoxControl" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

    <%--<h2>Venues</h2>
    <asp:Repeater ID="EventImagesContainer" runat="server" ItemType="EventSystem.Models.Venue"  ViewStateMode="Enabled" SelectMethod="VenueImagesContainer_GetData">
    <ItemTemplate>
    <My:UserInfoBoxControl runat="server" Target='<%# "~/Venues/VenueDetails?id="+Item.Id %>' Info='<%# ""+Item.Name %>' ImageUrl="<%#:Item.ImageUrl %>" ID="MyUserInfoBoxControl" />
    </ItemTemplate>
    </asp:Repeater>--%>
    </div>

</asp:Content>
