<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllEvents.aspx.cs" Inherits="EventSystem.Web.Event.ListAllEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListViewVenues" runat="server"
        ItemType="EventSystem.Models.Event"
        SelectMethod="ListViewEvent_GetData"
        DataKeyNames="Id">
        <LayoutTemplate>
            <table class="table table-striped">
                <tr>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByTitle"
                            CommandName="Sort" CommandArgument="Title">
                            Title
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByLocation"
                            CommandName="Sort" CommandArgument="Location">
                            Location
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByPrice"
                            CommandName="Sort" CommandArgument="Price">
                            Price
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="SortByStartDate"
                            CommandName="Sort" CommandArgument="StartDate">
                            Start Date
                        </asp:LinkButton>
                    </th>
                    <th>
                        <asp:LinkButton runat="server" ID="LinkButtonEndDate"
                            CommandName="Sort" CommandArgument="EndDate">
                            End Date
                        </asp:LinkButton>
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Title %></td>
                <td><%#: Item.Description %></td>
                <td><%#: Item.Price %></td>
                <td><%#: Item.StartDate %></td>
                <td><%#: Item.EndDate %></td>
                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%#: "EventDetails?id="+ Item.Id %>' Text="Details" CssClass="btn btn-default"></asp:HyperLink>
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
    </asp:ListView>
    <asp:DataPager ID="DataPagerVenues" runat="server" PagedControlID="ListViewVenues" PageSize="5">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        </Fields>
    </asp:DataPager>
</asp:Content>
