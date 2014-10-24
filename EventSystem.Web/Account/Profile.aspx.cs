using EventSystem.Models;
using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using System.IO;

namespace EventSystem.Web.Account
{
    public partial class Profile : PageBase
    {
        protected User CurrentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ErrorNotifierControl.Visible = false;

            var requestUserId = this.Request["id"];
            if (requestUserId != null && !(this.User.Identity.IsAuthenticated && this.LoggedUser.Id == requestUserId))
            { 
                this.ListViewMyEvents.Visible = false;
                this.ListViewMyVenues.Visible = false;
                this.DataPager1.Visible = false;
                this.DataPagerVenues.Visible = false; 
                Button btnEdit = FormViewProfile.FindControl("btnEdit") as Button;
                btnEdit.Visible = false;
            }
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public EventSystem.Models.User FormViewProfile_GetItem(string id)
        {
            var requestUserId = this.Request["id"];
            if (requestUserId != null)
            {
                return this.Data.Users.Find(requestUserId);
            }
            var user = this.Data.Users.Find(Context.User.Identity.GetUserId());
            return user;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FormViewProfile_UpdateItem(string id)
        {
            EventSystem.Models.User user = this.Data.Users.Find(id);

            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (user == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(user);

            const string ImagePath = "/Content/Images/Profile/";
            string imageUrl = "";

            FileUpload fileUploadControl = this.FormViewProfile.FindControl("FileUploadControl") as FileUpload;

            if (!string.IsNullOrEmpty(fileUploadControl.FileName))
            {
                try
                {
                    if (fileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                        fileUploadControl.PostedFile.ContentType == "image/png")
                    {
                        if (fileUploadControl.PostedFile.ContentLength < 512000)
                        {
                            string fileExtention = Path.GetExtension(fileUploadControl.FileName);
                            imageUrl = ImagePath + id + fileExtention;
                            fileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);

                            user.ProfileImageUrl = imageUrl;
                        }
                        else
                        {
                            this.ErrorNotifierControl.ErrorMessageText = "The file has to be less than 500 kb!";
                            this.ErrorNotifierControl.Visible = true;
                            return;
                        }
                    }
                    else
                    {
                        this.ErrorNotifierControl.ErrorMessageText = "Only JPEG or PNG files are accepted!";
                        this.ErrorNotifierControl.Visible = true;
                        return;
                    }
                }
                catch (Exception ex)
                {
                    this.ErrorNotifierControl.ErrorMessageText = "Upload status: The file could not be uploaded. " + ex.Message;
                    this.ErrorNotifierControl.Visible = true;
                    return;
                }
            }

            if (ModelState.IsValid)
            {
                this.Data.SaveChanges();
                // Save changes here, e.g. MyDataLayer.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<EventSystem.Models.Event> ListViewMyEvents_GetData()
        {
            var currentUserId = Context.User.Identity.GetUserId();
            var events = this.Data.Events.All().Include("Venue").Where(e => e.Host.Id == currentUserId);
            return events;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewMyEvents_UpdateItem(int id)
        {
            EventSystem.Models.Event item = this.Data.Events.Find(id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                Response.Redirect(Request.RawUrl);
                return;
            }

            TryUpdateModel(item);

            const string ImagePath = "/Content/Images/Event/";
            string imageUrl = "";

            var listViewItem = this.ListViewMyEvents.EditItem;
            var fileUploadControl = listViewItem.FindControl("FileUploadControl") as FileUpload;

            if (!string.IsNullOrEmpty(fileUploadControl.FileName))
            {
                try
                {
                    if (fileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                        fileUploadControl.PostedFile.ContentType == "image/png")
                    {
                        if (fileUploadControl.PostedFile.ContentLength < 512000)
                        {
                            string fileExtention = Path.GetExtension(fileUploadControl.FileName);
                            imageUrl = ImagePath + id + fileExtention;
                            fileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);
                            item.ImageUrl = imageUrl;
                        }
                        else
                        {
                            this.ErrorNotifierControl.ErrorMessageText = "The file has to be less than 500 kb!";
                            this.ErrorNotifierControl.Visible = true;
                            Response.Redirect(Request.RawUrl);
                            return;
                        }
                    }
                    else
                    {
                        this.ErrorNotifierControl.ErrorMessageText = "Only JPEG or PNG files are accepted!";
                        this.ErrorNotifierControl.Visible = true;
                        Response.Redirect(Request.RawUrl);
                        return;
                    }
                }
                catch (Exception ex)
                {
                    this.ErrorNotifierControl.ErrorMessageText = "Upload status: The file could not be uploaded. " + ex.Message;
                    this.ErrorNotifierControl.Visible = true;
                    Response.Redirect(Request.RawUrl);
                    return;
                }
            }

            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                this.Data.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<EventSystem.Models.Venue> ListViewMyVenues_GetData()
        {
            var currentUserId = Context.User.Identity.GetUserId();
            var venues = this.Data.Venues.All().Where(v => v.Host.Id == currentUserId);
            return venues;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewMyVenues_UpdateItem(int id)
        {
            EventSystem.Models.Venue item = this.Data.Venues.Find(id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            TryUpdateModel(item);

            const string ImagePath = "/Content/Images/Venue/";
            string imageUrl = "";

            var listViewItem = this.ListViewMyVenues.EditItem;
            var fileUploadControl = listViewItem.FindControl("FileUploadControl") as FileUpload;

            if (!string.IsNullOrEmpty(fileUploadControl.FileName))
            {
                try
                {
                    if (fileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                        fileUploadControl.PostedFile.ContentType == "image/png")
                    {
                        if (fileUploadControl.PostedFile.ContentLength < 512000)
                        {
                            string fileExtention = Path.GetExtension(fileUploadControl.FileName);
                            imageUrl = ImagePath + id + fileExtention;
                            fileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);
                            item.ImageUrl = imageUrl;
                        }
                        else
                        {
                            this.ErrorNotifierControl.ErrorMessageText = "The file has to be less than 500 kb!";
                            this.ErrorNotifierControl.Visible = true;
                            return;
                        }
                    }
                    else
                    {
                        this.ErrorNotifierControl.ErrorMessageText = "Only JPEG or PNG files are accepted!";
                        this.ErrorNotifierControl.Visible = true;
                        return;
                    }
                }
                catch (Exception ex)
                {
                    this.ErrorNotifierControl.ErrorMessageText = "Upload status: The file could not be uploaded. " + ex.Message;
                    this.ErrorNotifierControl.Visible = true;
                    return;
                }
            }

            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                this.Data.SaveChanges();
            }
        }
    }
}