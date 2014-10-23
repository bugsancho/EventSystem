<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VenueDetails.aspx.cs" Inherits="EventSystem.Web.Venues.VenueDetails" %>

<asp:Content ID="ContentVenueDetails" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <p class="alert alert-danger" id="errorBox" runat="server">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <asp:FormView ID="FormViewVenue"
        DataKeyNames="Id"
        GridLines="None"
        SelectMethod="FormViewVenue_GetItem"
        UpdateMethod="FormViewVenue_UpdateItem"
        runat="server" ItemType="EventSystem.Models.Venue">

        <ItemTemplate>
            <h2>Venue details</h2>
            <div class="pull-right">
                <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
            </div>
            <table class="table">
                <tr>
                    <td>Name</td>
                    <td><%#: Item.Name %></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td><%#: Item.Location %></td>
                </tr>
                <tr>
                    <td>Available seats</td>
                    <td><%#: Item.AvailableSeats %></td>
                </tr>
                <tr>
                    <td></td>
                    <td><img src="<%#: Item.ImageUrl %>" width="200"  height="200" /></td>
                </tr>
            </table>
        </ItemTemplate>
        <EditItemTemplate>
            <h2>Venue details</h2>
            <div class="pull-right">
                <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                <asp:Button runat="server" ID="btnDelete" CssClass="btn" Text="Cancel" CommandName="Cancel" />
            </div>
            <table class="table">
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="TextBoxName"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.Name %>' />
                    </td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <asp:TextBox ID="TextBoxLocation"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.Location %>' />

                    </td>
                </tr>
                <tr>
                    <td><b>Available seats</b></td>
                    <td>
                        <asp:TextBox ID="TextBoxAvailableSeats"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.AvailableSeats %>' /></td>
                </tr>
                <tr>
                    <td><asp:FileUpload ID="FileUploadControl" runat="server" /></td>
                    <td><img src="<%#: Item.ImageUrl %>"  width="200"  height="200" /></td>
                </tr>
            </table>
        </EditItemTemplate>


    </asp:FormView>
</asp:Content>
