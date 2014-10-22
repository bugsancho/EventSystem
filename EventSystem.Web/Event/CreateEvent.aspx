<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="EventSystem.Web.Event.CreateEvent" %>
<asp:Content ID="ContentCreateEvent" ContentPlaceHolderID="MainContent" runat="server">
    <p class="alert alert-danger" id="errorBox" runat="server">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div>
        <h4>Create a new event</h4>
        <hr />
    
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Title" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Title" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Title"
                  CssClass="text-danger" ErrorMessage="The title field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Description" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Description"
                  CssClass="text-danger" ErrorMessage="The description field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Price" CssClass="col-md-2 control-label">Price</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Price" CssClass="form-control" />
                <asp:RangeValidator runat="server" Type="Double" MinimumValue="0" MaximumValue="100000" ControlToValidate="Price"
                    ErrorMessage="The price must be greater than 0" /><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Price"
                  CssClass="text-danger" ErrorMessage="The price field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUploadControl" CssClass="col-md-2 control-label">Image</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="FileUploadControl" runat="server" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">
                <asp:Button runat="server" OnClick="CreateEvent_Click" Text="Create" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
