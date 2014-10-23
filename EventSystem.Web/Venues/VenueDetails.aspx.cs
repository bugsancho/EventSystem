using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EventSystem.Web.Models;
using System.IO;

namespace EventSystem.Web.Venues
{
    public partial class VenueDetails : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;

            int venueId = int.Parse(this.Request["id"]);
            var venue = this.Data.Venues.Find(venueId);

            if (venue.Host == null && !this.User.IsInRole("admin"))
            {
                Button btnEdit = FormViewVenue.FindControl("btnEdit") as Button;
                btnEdit.Visible = false;
            }
        }

        public object FormViewVenue_GetItem()
        {
            int id = int.Parse(this.Request["id"]);

            return this.Data.Venues.Find(id);
        }

        public void FormViewVenue_UpdateItem(int id)
        {
            EventSystem.Models.Venue item = null;
            item = this.Data.Venues.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);

            // get uploaded file
            const string ImagePath = "/Content/Images/Venue/";
            string imageUrl = "";

            FileUpload fileUploadControl = FormViewVenue.FindControl("FileUploadControl") as FileUpload;

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
                    this.ErrorMessage.Text = "Upload status: The file could not be uploaded. " + ex.Message;
                    this.errorBox.Visible = true;
                    return;
                }
            }

            if (ModelState.IsValid)
            {
                this.Data.SaveChanges();
            }
        }
    }
}