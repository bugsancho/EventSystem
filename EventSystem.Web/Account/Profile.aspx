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
</asp:Content>
