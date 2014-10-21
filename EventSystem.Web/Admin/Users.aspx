<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EventSystem.Web.Admin.Users" MasterPageFile="~/Site.Master" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:GridView ID="GridView1" ItemType="EventSystem.Models.User" DataKeyNames="Id" AutoGenerateColumns="false" SelectMethod="GridView1_GetData" UpdateMethod="GridView1_UpdateItem" AutoGenerateEditButton="true" runat="server">
        <Columns>
            <asp:DynamicField DataField="Email" />
            <asp:DynamicField DataField="UserName" />
            <asp:DynamicField DataField="PhoneNumber" />
            <asp:DynamicField DataField="FirstName" />
            <asp:DynamicField DataField="LastName" />
        </Columns>
    </asp:GridView>
</asp:Content>

