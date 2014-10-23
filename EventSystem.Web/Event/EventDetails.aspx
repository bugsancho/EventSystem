<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="EventSystem.Web.Event.EventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="EventContent" runat="server" CssClass="row">
        <asp:Image ID="Image1" runat="server" CssClass="col-md-4" />
        <asp:Panel ID="Panel1" runat="server" CssClass="col-md-8">
            <asp:DetailsView ID="DetailsViewEvents"
                             runat="server"
                             AutoGenerateRows="false"                         
                             DataKeyNames="Id"
                             CssClass="table table-striped table-hover col-md-7">
                <HeaderTemplate>
                    <h2 class="text-center">Event Details</h2>
                </HeaderTemplate>
                <Fields>
                    <asp:BoundField  DataField="Title" HeaderText="Title" />
                    <asp:BoundField  DataField="Description" HeaderText="Description" />
                    <asp:BoundField  DataField="StartDate" HeaderText="Start Date" />
                    <asp:BoundField  DataField="EndDate" HeaderText="End Date" />
                    <asp:BoundField  DataField="Category" HeaderText="Category" />
                    <asp:BoundField  DataField="PurchasedTickets" HeaderText="Purchased Tickets" />
                    <asp:BoundField  DataField="TicketsLeft" HeaderText="Tickets Left" />
                    <asp:BoundField  DataField="Price"  HeaderText="Price" />
                    <asp:HyperLinkField DataNavigateUrlFields="HostProfileLink" DataTextField="Host" HeaderText="Hosted By" />
                </Fields>
            </asp:DetailsView>
        </asp:Panel>
        <asp:Panel runat="server" CssClass="text-center">
            <asp:Button  runat="server" ID="JoinEventBtn" OnClick="JoinEventBtn_Click" Text="Join" CssClass="btn btn-default"/>
            <asp:TextBox runat="server" Id="TextBoxComment" TextMode="MultiLine" CssClass="form-control"/>
            <asp:Button Text="Comment" runat="server" id="BtnSubmitComment" CssClass="btn btn-info" OnClick="BtnSubmitComment_Click"/>
        </asp:Panel>
    </asp:Panel>

    <h1 class="text-center"> Comments</h1>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:ListView runat="server" ID="ListViewComments" 
                          ItemType="EventSystem.Models.Comment" 
                          SelectMethod="CommentsPanel_GetData"
                          DataKeyNames="Id">
                <EmptyDataTemplate>
                    <h1 class="text-center alert alert-info">This event has no comments yet!</h1>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <table runat="server" id="table1" class="table table-striped table-hover text-center">
                        <tr runat="server">
                            <th runat="server" class="text-center  col-md-2 ">
                                <asp:LinkButton runat="server" ID="SortByDate" CommandName="Sort"
                                                CommandArgument="Date">Date</asp:LinkButton>
                            </th>
                            <th runat="server" class="text-center col-md-2">
                                <asp:LinkButton runat="server" ID="SortByUser" >User</asp:LinkButton>
                            </th>
                            <th runat="server" class="text-center">
                                <asp:LinkButton runat="server" ID="SortByText" CommandName="Sort"
                                                CommandArgument="Text">Comment</asp:LinkButton>
                            </th>
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
                            <asp:Label ID="UserName" 
                                       runat="server" 
                                       CssClass="badge"
                                       Text='<%#: Item.Date %>' />
                        </td>
                        <td runat="server">
                            <asp:Label ID="FirstName" 
                                       runat="server" 
                                       Text='<%#: Item.User.UserName %>' />
                        </td>
                        <td runat="server">
                            <asp:Label ID="LastName" 
                                       runat="server" 
                                       Text='<%#: Item.Text %>' />
                        </td>
                    </tr>
                </ItemTemplate>

            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>