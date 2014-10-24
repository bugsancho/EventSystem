<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateEvent.aspx.cs" Inherits="EventSystem.Web.Event.CreateEvent" %>
<%@ Register TagPrefix="My" TagName="ErrorNotifier" Src="~/Controls/ErrorNotifier.ascx" %>
<asp:Content ID="ContentCreateEvent" ContentPlaceHolderID="MainContent" runat="server">
     <My:ErrorNotifier runat="server" ID="ErrorNotifierControl"/>

    <div runat="server" id="CreateEventPageContent">
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
            <asp:Label runat="server" AssociatedControlID="Categories" CssClass="col-md-2 control-label">Categories</asp:Label>
            <div>
                <asp:DropDownList ID="Categories" runat="server" ItemType="EventSystem.Models.EventCategory"
                    SelectMethod="DropDownListCategories_GetData" DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DropDownVenues" CssClass="col-md-2 control-label">Venues</asp:Label>
            <div>
                <asp:DropDownList ID="DropDownVenues" runat="server" ItemType="EventSystem.Models.Venue"
                    SelectMethod="DropDownListVenues_GetData" DataTextField="Name" DataValueField="Id">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxStartDate" CssClass="col-md-2 control-label">Start Date</asp:Label>
            <div>
                <asp:TextBox ID="TextBoxStartDate" runat="server" ReadOnly="true"></asp:TextBox>
                <img src="../Content/Images/calender.png" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TextBoxEndDate" CssClass="col-md-2 control-label">End Date</asp:Label>
            <div>
                <asp:TextBox ID="TextBoxEndDate" runat="server" ReadOnly="true"></asp:TextBox>
                <img src="../Content/Images/calender.png" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUploadControl" CssClass="col-md-2 control-label">Image</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="FileUploadControl" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">
                <asp:Button runat="server" OnClick="CreateEvent_Click" Text="Create" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <script src="../Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="../Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="../Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBoxStartDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
            $("#<%=TextBoxEndDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
        });
    </script>
</asp:Content>
