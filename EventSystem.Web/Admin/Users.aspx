<%@ Page Language="C#" 
AutoEventWireup="true" 
CodeBehind="Users.aspx.cs" 
Inherits="EventSystem.Web.Admin.Users" 
MasterPageFile="~/Site.Master" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <My:ErrorNotifier runat="server" ID="ErrorNotifierControl"/>

    <h2 class="text-center">All users</h2>
    <br />
    <asp:ListView runat="server" ID="ListView1" 
                  ItemType="EventSystem.Models.User" 
                  DataKeyNames="Id"
                  SelectMethod="ListView1_GetData"
                  UpdateMethod="ListView1_UpdateItem"
                  DeleteMethod="ListView1_DeleteItem">
        <LayoutTemplate>
            <table runat="server" id="table1" class="table table-striped table-hover text-center">
                <tr runat="server">
                    <th runat="server" class="text-center">
                        <asp:LinkButton runat="server" ID="SortByUsername" CommandName="Sort"
                                        CommandArgument="UserName">Username</asp:LinkButton>
                    </th>
                    <th runat="server" class="text-center">
                        <asp:LinkButton runat="server" ID="SortByFirstName" CommandName="Sort"
                                        CommandArgument="FirstName">First Name</asp:LinkButton>
                    </th>
                    <th runat="server" class="text-center">
                        <asp:LinkButton runat="server" ID="SortByLastName" CommandName="Sort"
                                        CommandArgument="LastName">Last Name</asp:LinkButton>
                    </th>
                    <th runat="server" class="text-center">
                        <asp:LinkButton runat="server" ID="SortByEmail" CommandName="Sort"
                                        CommandArgument="Email">Email</asp:LinkButton>
                    </th>
                    <th runat="server" class="text-center">
                        <asp:LinkButton runat="server" ID="SortByPhoneNumber" CommandName="Sort"
                                        CommandArgument="PhoneNumber">Phone Number</asp:LinkButton>
                    </th>
                    <th runat="server" class="text-center">Action</th>
                </tr>
                <tr runat="server" id="itemPlaceholder" >
                </tr>
            </table>
            <div>
                <asp:DataPager ID="DataPagerCustomers" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                        <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-default" NextPreviousButtonCssClass="btn btn-default" NumericButtonCssClass ="btn btn-default" />
                        <asp:NextPreviousPagerField ShowLastPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td runat="server">
                    <asp:HyperLink ID="UserName" 
                                   NavigateUrl='<%#: "~/Account/Profile?id="+ Item.Id %>'
                                   runat="server" 
                                   Text='<%#: Item.UserName %>' />
                </td>
                <td runat="server">
                    <asp:Label ID="FirstName" 
                               runat="server" 
                               Text='<%#: Item.FirstName %>' />
                </td>
                <td runat="server">
                    <asp:Label ID="LastName" 
                               runat="server" 
                               Text='<%#: Item.LastName %>' />
                </td>
                <td runat="server">
                    <asp:Label ID="Email" 
                               runat="server" 
                               Text='<%#: Item.Email %>' />
                </td>
                <td runat="server">
                    <asp:Label ID="PhoneNumber" 
                               runat="server" 
                               Text='<%#: Item.PhoneNumber %>' />
                </td>
                <td runat="server">
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this user and all its events and venues?');"/>
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr runat="server">
                <td runat="server">
                    <asp:TextBox ID="Label3" 
                                 runat="server"
                                 Enabled="false"
                                 CssClass="form-control"
                                 Text='<%#: BindItem.UserName %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="FirstName" 
                                 runat="server"
                                 CssClass="form-control"
                                 Text='<%#: BindItem.FirstName %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="LastName" 
                                 runat="server"
                                 CssClass="form-control" 
                                 Text='<%#: BindItem.LastName %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="Label1" 
                                 runat="server" 
                                 CssClass="form-control"
                                 Text='<%#: BindItem.Email %>' />
                </td>
                <td runat="server">
                    <asp:TextBox ID="Label2" 
                                 runat="server"
                                 CssClass="form-control"
                                 Text='<%#: BindItem.PhoneNumber %>' />
                </td>
                <td runat="server">
                    <asp:Button runat="server" ID="btnEdit" CssClass="btn btn-warning" Text="Update" CommandName="Update" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>

