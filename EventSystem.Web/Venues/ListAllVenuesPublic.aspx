<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllVenuesPublic.aspx.cs" Inherits="EventSystem.Web.Venues.ListAllVenuesPublic" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>

<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/Controls/ImageTile.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <My:ErrorNotifier runat="server" ID="ErrorNotifierControl"/>
    <div class="text-center">
        <asp:Label Text="Search: " AssociatedControlID="TextBoxSearch" runat="server" />
        <asp:TextBox runat="server" ID="TextBoxSearch" />
        <asp:Button CssClass="btn btn-default" OnClick="SearchBtn_Click" Text="Search" runat="server" />
    </div>
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Venues</h3>
            </div>
            <asp:ListView runat="server" ID="ListView1"
                ItemType="EventSystem.Models.Venue"
                DataKeyNames="Id"
                SelectMethod="ListView1_GetData">
                <LayoutTemplate>
                    <div class="text-center">
                        <asp:Label Text="Sort By: " runat="server" />
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByName" CommandName="Sort"
                            CommandArgument="Name">Name</asp:LinkButton>
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByLocation" CommandName="Sort"
                            CommandArgument="Location">Location</asp:LinkButton>
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByAvailableSeats" CommandName="Sort"
                            CommandArgument="AvailableSeats">Available Seats</asp:LinkButton>
                    </div>
                    <div class="panel-body">
                        <div runat="server" id="itemPlaceholder">
                        </div>
                    </div>
                    <div class="text-center">
                        <asp:DataPager ID="DataPagerCustomers" runat="server" PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="True"
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                                <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-default" NextPreviousButtonCssClass="btn btn-default" NumericButtonCssClass="btn btn-default" />
                                <asp:NextPreviousPagerField ShowLastPageButton="True"
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="col-md-3">
                        <My:UserInfoBoxControl runat="server"
                            Target='<%# "~/Venues/VenueDetails?id="+Item.Id %>'
                            Info='<%# ""+Item.Name %>'
                            ImageUrl="<%#:Item.ImageUrl %>"
                            ID="MyUserInfoBoxControl" />
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
