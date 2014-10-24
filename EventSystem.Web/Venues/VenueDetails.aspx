<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VenueDetails.aspx.cs" Inherits="EventSystem.Web.Venues.VenueDetails" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>

<asp:Content ID="ContentVenueDetails" ContentPlaceHolderID="MainContent" runat="server">
    <My:ErrorNotifier runat="server" ID="ErrorNotifierControl"/>

    <div class="col-md-12">
        <asp:FormView ID="FormViewVenue"
                      DataKeyNames="Id"
                      SelectMethod="FormViewVenue_GetItem"
                      UpdateMethod="FormViewVenue_UpdateItem"
                      runat="server" ItemType="EventSystem.Models.Venue"
                      RenderOuterTable="false">
            <ItemTemplate>
                <img src="<%#: Item.ImageUrl %>" class="col-md-4" />

                <div class="col-md-8">
                    <table class="table table-striped table-hover col-md-7" border="1">
                        <tr>
                            <td colspan="2">
                                <h2 class="text-center">Venue details</h2>
                            </td>
                        </tr>
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
                    </table>
                    <div class="pull-right">
                        <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
                    </div>
                </div>

            </ItemTemplate>
            <EditItemTemplate>
                <img src="<%#: Item.ImageUrl %>" class="col-md-4" />

                <div class="col-md-8">
                    <table class="table table-striped table-hover col-md-7" border="1">
                        <tr>
                            <td colspan="2">
                                <h2 class="text-center">Venue details</h2>
                            </td>
                        </tr>
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
                            <td>Available seats</td>
                            <td>
                                <asp:TextBox ID="TextBoxAvailableSeats"
                                             runat="server"
                                             CssClass="form-control"
                                             Text='<%#: BindItem.AvailableSeats %>' />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:FileUpload ID="FileUploadControl" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <div class="pull-right">
                        <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                        <asp:Button runat="server" ID="btnDelete" CssClass="btn" Text="Cancel" CommandName="Cancel" />
                    </div>
                </div>

            </EditItemTemplate>
        <%--<EditItemTemplate>
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
        <td>
        <asp:FileUpload ID="FileUploadControl" runat="server" /></td>
        <td>
        <img src="<%#: Item.ImageUrl %>" width="200" height="200" /></td>
        </tr>
        </table>
        </EditItemTemplate>--%>
        </asp:FormView>
    </div>
</asp:Content>
