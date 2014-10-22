using EventSystem.Models;
using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;

namespace EventSystem.Web.Account
{
    public partial class Profile : PageBase
    {
        protected User CurrentUser;

        protected void Page_Load(object sender, EventArgs e)
        {

            var user = this.Data.Users.Find(this.CurrentUserId);
            if (user == null)
            {
                //redirect
                this.Response.Redirect("/Account/Login");
                return;
            }
            CurrentUser = user;
        }

        protected string CurrentUserId
        {
            get
            {
                return Context.User.Identity.GetUserId();
            }
        }
    }
}