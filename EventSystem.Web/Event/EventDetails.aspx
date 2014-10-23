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
                <Fields>
                    <asp:BoundField  ControlStyle-CssClass="" DataField="Title" HeaderText="Title" />
                    <asp:BoundField  DataField="Description" HeaderText="Description" />
                    <asp:BoundField  DataField="StartDate" HeaderText="Start Date" />
                    <asp:BoundField  DataField="EndDate" HeaderText="End Date" />
                    <asp:BoundField  DataField="Category" HeaderText="Category" />
                    <asp:BoundField  DataField="PurchasedTickets" HeaderText="Purchased Tickets" />
                    <asp:BoundField  DataField="TicketsLeft" HeaderText="Tickets Left" />
                    <asp:BoundField  DataField="Price" HeaderText="Price" />
                    <asp:BoundField  DataField="Host" HeaderText="Hosted by" />
                </Fields>
            </asp:DetailsView>
        </asp:Panel>
        <asp:Button  runat="server" ID="JoinEventBtn" OnClick="JoinEventBtn_Click" Text="Join" CssClass="btn btn-default"/>
        <asp:TextBox runat="server" Id="TextBoxComment"/>
        <asp:Button Text="Comment" runat="server" id="BtnSubmitComment" OnClick="BtnSubmitComment_Click"/>
    </asp:Panel>
</asp:Content>