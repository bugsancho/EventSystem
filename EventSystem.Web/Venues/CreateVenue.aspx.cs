
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
            this.errorBox.Visible = false;
        }

        protected void CreateVenue_Click(object sender, EventArgs e)
        {
            const string ImagePath = "/Content/Images/Venue/";
            string imageUrl = "";

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

            // TODO: Add confirm message

            Response.Redirect("/");
        }
    }
}