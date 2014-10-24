using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using EventSystem.Models;
using System.IO;
using EventSystem.Web.Models;

namespace EventSystem.Web.Account
{
    public partial class Register : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ErrorNotifierControl.Visible = false;
        }
       
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            const string ImagePath = "/Content/Images/Profile/";

            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                    FileUploadControl.PostedFile.ContentType == "image/png" ||
                    FileUploadControl.PostedFile.ContentLength == 0)
                {
                    if (FileUploadControl.PostedFile.ContentLength < 512000)
                    {
                        var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                        var user = new User()
                        {
                            UserName = Email.Text,
                            Email = Email.Text,
                            FirstName = FirstName.Text,
                            LastName = LastName.Text,
                            PhoneNumber = PhoneNumber.Text
                        };

                        IdentityResult result = manager.Create(user, Password.Text);
                        if (FileUploadControl.PostedFile.ContentLength == 0 && result.Succeeded)
                        {
                            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        }
                        else if (result.Succeeded)
                        {
                            string fileExtention = Path.GetExtension(FileUploadControl.FileName);
                            var id = user.Id;
                            var url = ImagePath + id + fileExtention;
                            FileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);
                            this.Data.Users.Find(user.Id).ProfileImageUrl = url;
                            //user.ProfileImageUrl = url;
                            this.Data.SaveChanges();
                            // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                            //string code = manager.GenerateEmailConfirmationToken(user.Id);
                            //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                            //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                            IdentityHelper.SignIn(manager, user, isPersistent: false);
                            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        }
                        else
                        {
                            this.ErrorNotifierControl.Visible = true;
                            ErrorNotifierControl.ErrorMessageText = result.Errors.FirstOrDefault();
                        }
                        //EventSystem.Models.Event newEvent = new EventSystem.Models.Event();
                        //newEvent.Title = this.Title.Text;
                        //newEvent.Description = this.Description.Text;
                        //newEvent.Category = this.Data.EventCategories.Find(int.Parse(this.Categories.SelectedValue));
                        //newEvent.Venue = this.Data.Venues.Find(int.Parse(this.DropDownVenues.SelectedValue));
                        //newEvent.Price = decimal.Parse(this.Price.Text);
                        //newEvent.StartDate = DateTime.Parse(Request.Form[TextBoxStartDate.UniqueID]);
                        //newEvent.EndDate = DateTime.Parse(Request.Form[TextBoxEndDate.UniqueID]);
                        //
                        //var currentUserId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(this.User.Identity);
                        //var currentUser = this.Data.Users.Find(currentUserId);
                        //newEvent.Host = currentUser;
                        //
                        //this.Data.Events.Add(newEvent);
                        //this.Data.SaveChanges();
                        //
                        //int id = newEvent.Id;
                        //
                        //string fileExtention = Path.GetExtension(FileUploadControl.FileName);
                        //imageUrl = ImagePath + id + fileExtention;
                        //FileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);
                        //
                        //// save file path to entity
                        //newEvent = this.Data.Events.All().FirstOrDefault(ev => ev.Id == id);
                        //newEvent.ImageUrl = imageUrl;
                        //this.Data.SaveChanges();
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
    }
}