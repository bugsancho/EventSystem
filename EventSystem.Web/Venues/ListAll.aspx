<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAll.aspx.cs" Inherits="EventSystem.Web.Venues.ListAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListViewVenues" runat="server" ItemType="EventSystem.Models.Venue" SelectMethod="ListViewVenues_GetData" DataKeyNames="Id">
        <LayoutTemplate>
            <table class="table table-striped">
                <tr>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Available seats</th>
                    <th></th>
                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td><%#: Item.Location %></td>
                <td><%#: Item.AvailableSeats %></td>
                <td><asp:HyperLink runat="server" NavigateUrl='<%#: "VenueDetails.aspx?ID="+ Item.Id %>'  Text="Details" CssClass="btn"></asp:HyperLink> </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerVenues" runat="server" PagedControlID="ListViewVenues" PageSize="5">
    <Fields>
        <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
        <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
    </Fields>
</asp:DataPager>
</asp:Content>
