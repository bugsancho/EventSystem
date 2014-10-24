
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventSystem.Web.Models;
using System.IO;
using System.Data.Entity;

namespace EventSystem.Web.Venue
{
    public partial class CreateVenue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ErrorNotifierControl.Visible = false;
        }

        protected void CreateVenue_Click(object sender, EventArgs e)
        {
            const string ImagePath = "/Content/Images/Venue/";
            string imageUrl = "";

            if (string.IsNullOrEmpty(FileUploadControl.FileName))
            {
                this.ErrorNotifierControl.ErrorMessageText = "Image is required!";
                this.ErrorNotifierControl.Visible = true;
                return;
            }

            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                    FileUploadControl.PostedFile.ContentType == "image/png")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 512000)
                    {
                        EventSystem.Models.Venue newVenue = new EventSystem.Models.Venue();
                        newVenue.Name = this.Name.Text;
                        newVenue.Location = this.Location.Text;
                        newVenue.AvailableSeats = int.Parse(this.AvailableSeats.Text);
                        newVenue.Host = this.LoggedUser;

                        this.Data.Venues.Add(newVenue);
                        this.Data.SaveChanges();

                        int id = newVenue.Id;

                        // Save uploaded file
                        string fileExtention = Path.GetExtension(FileUploadControl.FileName);
                        imageUrl = ImagePath + id + fileExtention;
                        FileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);

                        // save file path to entity
                        newVenue = this.Data.Venues.All().FirstOrDefault(k => k.Id == id);
                        newVenue.ImageUrl = imageUrl;
                        this.Data.SaveChanges();
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

            Response.Redirect("/");
        }
    }
}