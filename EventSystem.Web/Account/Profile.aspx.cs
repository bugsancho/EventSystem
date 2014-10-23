﻿using EventSystem.Models;
using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using System.IO;

namespace EventSystem.Web.Account
{
    public partial class Profile : PageBase
    {
        protected User CurrentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public EventSystem.Models.User FormViewProfile_GetItem(string id)
        {
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
                // Save changes here, e.g. MyDataLayer.SaveChanges();

            }
        }
    }
}