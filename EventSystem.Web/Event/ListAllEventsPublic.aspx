<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllEventsPublic.aspx.cs" Inherits="EventSystem.Web.Event.ListAllEventsPublic" %>

<%@ Register TagPrefix="My" TagName="UserInfoBoxControl" Src="~/Controls/ImageTile.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Events</h3>
            </div>
            <div class="panel-body">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="EventSystem.Models.Event" ViewStateMode="Enabled" SelectMethod="EventImagesContainer_GetData">
                    <ItemTemplate>
                        <My:UserInfoBoxControl runat="server"
                            Target='<%# "~/Event/EventDetails?id="+Item.Id %>'
                            Info='<%# ""+Item.Title %>'
                            ImageUrl='<%#:Item.ImageUrl %>'
                            AdditionalInfo='<%#: Item.StartDate.ToString("dd-MM-yyyy") %>'
                            ID="MyUserInfoBoxControl" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
