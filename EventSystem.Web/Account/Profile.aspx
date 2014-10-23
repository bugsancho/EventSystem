<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventSystem.Web.Account.Profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <p class="alert alert-danger" id="errorBox" runat="server">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <asp:FormView runat="server" 
        ID="FormViewProfile" 
        DataKeyNames="Id"
        ItemType="EventSystem.Models.User" 
        GridLines="None" 
        SelectMethod="FormViewProfile_GetItem" 
        UpdateMethod="FormViewProfile_UpdateItem">
        <ItemTemplate>
            <h2><%#: Item.FirstName + " " + Item.LastName %>'s account</h2>
            <div class="pull-right">
                <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
            </div>
            <table class="table table-striped">
                <tr>
                    <td>UserName</td>
                    <td><%#: Item.UserName %></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td><%#: Item.FirstName %></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><%#: Item.LastName %></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><%#: Item.PhoneNumber %></td>
                </tr>
                <tr>
                    <td>Profile Picture</td>
                    <td>
                        <div class="image-wrapper">
                            <img src="<%#: Item.GetProfileImageOrDefault() %>" />
                        </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="pull-right">
                <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                <asp:Button runat="server" ID="btnDelete" CssClass="btn" Text="Cancel" CommandName="Cancel" />
            </div>
            <table class="table table-striped">
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="TextBoxFirstName"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.FirstName %>' />
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="TextBoxLastName"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.LastName %>' />

                    </td>
                </tr>
                <tr>
                    <td><b>Available seats</b></td>
                    <td>
                        <asp:TextBox ID="TextBoxPhoneNumber"
                            runat="server"
                            CssClass="form-control"
                            Text='<%#: BindItem.PhoneNumber %>' />

                    </td>
                </tr>
                <tr>
                    <td><asp:FileUpload ID="FileUploadControl" runat="server" /></td>
                    <td>
                        <div class="image-wrapper">
                            <img src="<%#: Item.GetProfileImageOrDefault() %>" />
                        </div>

                    </td>
                </tr>
            </table>
        </EditItemTemplate>
     </asp:FormView>

    <asp:ListView runat="server" 
        ID="ListViewMyEvents" 
        ItemType="EventSystem.Models.Event" 
        SelectMethod="ListViewMyEvents_GetData"
        UpdateMethod="ListViewMyEvents_UpdateItem"
        DataKeyNames="Id">
        <LayoutTemplate>
            <h3>My Events</h3>
            <table class="table table-striped">
                <tr>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventName"
                                        CommandName="Sort" CommandArgument="Name">
                            Name
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByVenueName"
                                        CommandName="Sort" CommandArgument="Venue.Name">
                            Venue
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventLocation"
                                        CommandName="Sort" CommandArgument="Description">
                            Description
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventPrice"
                                        CommandName="Sort" CommandArgument="Price">
                            Price
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventStartDate"
                            CommandName="Sort" CommandArgument="StartDate">
                            Start Date
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventEndDate"
                            CommandName="Sort" CommandArgument="EndDate">
                            End Date
                        </asp:LinkButton>
                    </th>
                    <th>
                        Image
                    </th>
                </tr>
                <tbody id="itemPlaceholder" runat="server"></tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Title %></td>
                <td>
                    <a href="/Venues/VenueDetails?ID=<%#: Item.Venue.Id %>"><%#: Item.Venue.Name %></a>
                </td>
                <td><%#: Item.Description %></td>
                <td><%#: Item.Price %></td>
                <td><%#: Item.StartDate %></td>
                <td><%#: Item.EndDate %></td>
                <td>
                    <div class="image-wrapper">
                        <img src="<%#: Item.ImageUrl %>" />
                    </div>
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr runat="server">
                <td runat="server">
                    <asp:TextBox ID="TextBoxTitle"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.Title %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxDescription"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.Description %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxVenue"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.Price %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxStartDate"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.StartDate %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxEndDate"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.EndDate %>' />
                </td>
                <td runat="server">
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <div class="jumbotron">
                <h3>You have no events. <a href="/Event/CreateEvent">Click here to create an event</a></h3>
            </div>
        </EmptyDataTemplate>

    </asp:ListView>
    <asp:DataPager ID="DataPagerVenues" runat="server" PagedControlID="ListViewMyEvents" PageSize="2">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
            <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        </Fields>
    </asp:DataPager>

    <asp:ListView runat="server" 
        ID="ListViewMyVenues" 
        ItemType="EventSystem.Models.Venue" 
        SelectMethod="ListViewMyVenues_GetData"
        UpdateMethod="ListViewMyVenues_UpdateItem"
        DataKeyNames="Id">
        <LayoutTemplate>
            <h3>My Events</h3>
            <table class="table table-striped">
                <tr>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventName"
                                        CommandName="Sort" CommandArgument="Name">
                            Name
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventLocation"
                                        CommandName="Sort" CommandArgument="Location">
                            Location
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByEventPrice"
                                        CommandName="Sort" CommandArgument="Price">
                            Price
                        </asp:LinkButton>
                    </th>
                    <th>
                        Image
                    </th>
                </tr>
                <tbody id="itemPlaceholder" runat="server"></tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td><%#: Item.Location %></td>
                <td><%#: Item.AvailableSeats %></td>
                <td>
                    <div class="image-wrapper">
                        <img src="<%#: Item.ImageUrl %>" />
                    </div>
                    
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr runat="server">
                <td runat="server">
                    <asp:TextBox ID="TextBoxTitle"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.Name %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxDescription"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.Location %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxVenue"
                        runat="server"
                        CssClass="form-control"
                        Text='<%#: BindItem.AvailableSeats %>' />
                </td>
                <td>
                    <asp:FileUpload ID="FileUploadControl" runat="server" />

                </td>

                <td runat="server">
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <div class="jumbotron">
                <h3>You have no venues. <a href="/Venues/CreateVenue">Click here to create a venue</a></h3>
            </div>
        </EmptyDataTemplate>

    </asp:ListView>
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListViewMyVenues" PageSize="2">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
            <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        </Fields>
    </asp:DataPager>
</asp:Content>
