<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAll.aspx.cs" Inherits="EventSystem.Web.Venues.ListAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="alert alert-danger" id="errorBox" runat="server">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    
    <asp:ListView ID="ListViewVenues" runat="server" 
                  ItemType="EventSystem.Models.Venue" 
                  SelectMethod="ListViewVenues_GetData" 
                  UpdateMethod="ListViewVenues_UpdateItem"
                  DeleteMethod="ListViewVenues_DeleteItem"
                  DataKeyNames="Id">
        <LayoutTemplate>
            <table class="table table-striped">
                <tr>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByUsername"
                                        CommandName="Sort" CommandArgument="Name">
                            Name
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByLocation"
                                        CommandName="Sort" CommandArgument="Location">
                            Location
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByAvailableSeats"
                                        CommandName="Sort" CommandArgument="AvailableSeats">
                            Available seats
                        </asp:LinkButton>
                    </th>
                    <th>
                        Image
                    </th>
                    <th>
                        Actions
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td><%#: Item.Location %></td>
                <td><%#: Item.AvailableSeats %></td>
                <td class="col-md-3"><asp:Image runat="server" ID="imgItem" ImageUrl="<%#: Item.ImageUrl %>" Width="100%" /></td>
                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%#: "../Venues/VenueDetails.aspx?ID="+ Item.Id %>'  Text="Details" CssClass="btn btn-default"></asp:HyperLink>
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr runat="server">
                <td runat="server">
                    <asp:TextBox ID="TextBoxName" 
                                 runat="server"
                                 CssClass="form-control"
                                 Text='<%#: BindItem.Name %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxLocation" 
                                 runat="server"
                                 CssClass="form-control" 
                                 Text='<%#: BindItem.Location %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="TextBoxAvailableSeats" 
                                 runat="server" 
                                 CssClass="form-control"
                                 Text='<%#: BindItem.AvailableSeats %>' />
                    <br />
                </td>
                <td runat="server">
                    <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="form-control" />
                </td>
                <td runat="server">
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerVenues" runat="server" PagedControlID="ListViewVenues" PageSize="5">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
            <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        </Fields>
    </asp:DataPager>
</asp:Content>
