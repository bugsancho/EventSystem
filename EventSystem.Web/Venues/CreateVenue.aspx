<%@ Page Title="Create New Venue" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateVenue.aspx.cs" Inherits="EventSystem.Web.Venue.CreateVenue" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>
<asp:Content ID="ContentCreateVenue" ContentPlaceHolderID="MainContent" runat="server">
     <My:ErrorNotifier runat="server" ID="ErrorNotifierControl"/>

    <div class="form-horizontal">
        <h4>Create a new venue</h4>
        <hr />
    
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                  CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Location" CssClass="col-md-2 control-label">Location</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Location" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Location"
                  CssClass="text-danger" ErrorMessage="The location field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AvailableSeats" CssClass="col-md-2 control-label">Available seats</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AvailableSeats" CssClass="form-control" />
                <asp:RangeValidator runat="server" Type="Integer" MinimumValue="1" MaximumValue="100000" ControlToValidate="AvailableSeats" ErrorMessage="The available seats field must be number between 1 and 100000" /><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AvailableSeats"
                  CssClass="text-danger" ErrorMessage="The available seats field is required." />
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
                <asp:Button runat="server" OnClick="CreateVenue_Click" Text="Create" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
