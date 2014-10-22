<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VenueDetails.aspx.cs" Inherits="EventSystem.Web.Venues.VenueDetails" %>

<asp:Content ID="ContentVenueDetails" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:DetailsView ID="DetailsViewVenue" runat="server" AutoGenerateRows="False" DataKeyNames="Id" ItemType="EventSystem.Models.Venue" SelectMethod="DetailsViewVenue_GetItem" CssClass="table" GridLines="None">
        <Fields>
             <asp:BoundField DataField="Name" HeaderText="Name" />
             <asp:BoundField DataField="Location" HeaderText="Location" />
             <asp:BoundField DataField="AvailableSeats" HeaderText="Available seats" />
             <asp:ImageField DataImageUrlField="ImageUrl" ControlStyle-Width="300px" ControlStyle-Height="300px">
                 <ItemStyle  />
             </asp:ImageField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
