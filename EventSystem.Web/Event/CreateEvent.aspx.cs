using EventSystem.Models;
using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Event
{
    public partial class CreateEvent : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;
        }

        public void CreateEvent_Click(object sender, EventArgs e)
        {
            const string ImagePath = "/Content/Images/Event/";
            string imageUrl = "";

            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                    FileUploadControl.PostedFile.ContentType == "image/png")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 512000)
                    {
                        if (DateTime.Parse(Request.Form[TextBoxStartDate.UniqueID]) > DateTime.Parse(Request.Form[TextBoxEndDate.UniqueID]))
                        {
                            throw new Exception("Start date can not be after end date");
                        }

                        EventSystem.Models.Event newEvent = new EventSystem.Models.Event();
                        newEvent.Title = this.Title.Text;
                        newEvent.Description = this.Description.Text;
                        newEvent.Category = this.Data.EventCategories.Find(int.Parse(this.Categories.SelectedValue));
                        newEvent.Venue = this.Data.Venues.Find(int.Parse(this.DropDownVenues.SelectedValue));
                        newEvent.Price = decimal.Parse(this.Price.Text);
                        newEvent.StartDate = DateTime.Parse(Request.Form[TextBoxStartDate.UniqueID]);
                        newEvent.EndDate = DateTime.Parse(Request.Form[TextBoxEndDate.UniqueID]);

                        var currentUserId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(this.User.Identity);
                        var currentUser = this.Data.Users.Find(currentUserId);

                        newEvent.Host = currentUser;

                        this.Data.Events.Add(newEvent);
                        this.Data.SaveChanges();

                        int id = newEvent.Id;

                        string fileExtention = Path.GetExtension(FileUploadControl.FileName);
                        imageUrl = ImagePath + id + fileExtention;
                        FileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);

                        // save file path to entity
                        newEvent = this.Data.Events.All().FirstOrDefault(ev => ev.Id == id);
                        newEvent.ImageUrl = imageUrl;
                        this.Data.SaveChanges();
                    }
                    else
                    {
                        this.ErrorMessage.Text = "The file has to be less than 500 kb!";
                        this.errorBox.Visible = true;
                        return;
                    }
                }
                else
                {
                    this.ErrorMessage.Text = "Only JPEG or PNG files are accepted!";
                    this.errorBox.Visible = true;
                    return;
                }
            }
            catch (Exception ex)
            {
                this.ErrorMessage.Text = "Error while trying to create new event: " + ex.Message;
                this.errorBox.Visible = true;
                return;
            }

            // TODO: Add confirm message

            Response.Redirect("/");
        }

        public IQueryable<EventCategory> DropDownListCategories_GetData()
        {
            var data = this.Data.EventCategories.All().ToList().AsQueryable();
            return data;
        }

        public IQueryable<EventSystem.Models.Venue> DropDownListVenues_GetData()
        {
            var data = this.Data.Venues.All()
                           .Where(v => v.Host.Id == this.LoggedUser.Id)
                           .ToList().AsQueryable();
            return data;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
        }
    }
}