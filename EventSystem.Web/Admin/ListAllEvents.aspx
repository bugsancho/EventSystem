<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllEvents.aspx.cs" Inherits="EventSystem.Web.Event.ListAllEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p class="alert alert-danger" id="errorBox" runat="server">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <h2 class="text-center">All events</h2>
    <br />
    <asp:ListView ID="ListViewEvents" runat="server"
                  ItemType="EventSystem.Models.Event"
                  SelectMethod="ListViewEvents_GetData"
                  UpdateMethod="ListViewEvents_UpdateItem"
                  DeleteMethod="ListViewEvents_DeleteItem"
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
                        <asp:LinkButton runat="server" ID="SortByDescription"
                                        CommandName="Sort" CommandArgument="Description">
                            Description
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
                <td><%#: Item.Title %></td>
                <td><%#: Item.Description %></td>
                <td><%#: Item.Price %></td>
                <td><%#: Item.StartDate %></td>
                <td><%#: Item.EndDate %></td>
                <td class="col-md-3">
                    <asp:Image runat="server" ID="imgItem" ImageUrl="<%#: Item.ImageUrl %>" Width="100%" />
                </td>
                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%#: "../Event/EventDetails?id="+ Item.Id %>' Text="Details" CssClass="btn btn-default"></asp:HyperLink>
                    <br />
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
                    <br />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
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
                    <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="form-control" />
                </td>
                <td runat="server">
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                    <br />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:DataPager ID="DataPagerEvents" runat="server" PagedControlID="ListViewEvents" PageSize="5">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
        </Fields>
    </asp:DataPager>
</asp:Content>
