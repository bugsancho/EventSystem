<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllEventsPublic.aspx.cs" Inherits="EventSystem.Web.Event.ListAllEventsPublic" %>

<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/Controls/ImageTile.ascx" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <asp:Label Text="Search: " AssociatedControlID="TextBoxSearch" runat="server" />
        <asp:TextBox runat="server" ID="TextBoxSearch" />
        <asp:Button CssClass="btn btn-default" OnClick="SearchBtn_Click" Text="Search" runat="server" />
    </div>
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Events</h3>
            </div>
            <asp:ListView runat="server" ID="ListView1"
                ItemType="EventSystem.Models.Event"
                DataKeyNames="Id"
                SelectMethod="ListView1_GetData">
                <LayoutTemplate>
                    <div class="text-center">
                        <asp:Label Text="Sort By: " runat="server" />
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByTitle" CommandName="Sort"
                            CommandArgument="Title">Title</asp:LinkButton>
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByDate" CommandName="Sort"
                            CommandArgument="StartDate">Start Date</asp:LinkButton>
                        <asp:LinkButton CssClass="btn btn-default" runat="server" ID="SortByPrice" CommandName="Sort"
                            CommandArgument="Price">Price</asp:LinkButton>
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
                            Target='<%# "~/Event/EventDetails?id="+Item.Id %>'
                            Info='<%# ""+Item.Title %>'
                            ImageUrl='<%#:Item.ImageUrl %>'
                            AdditionalInfo='<%#: Item.StartDate.ToString("dd-MM-yyyy") %>'
                            ID="MyUserInfoBoxControl" />
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
