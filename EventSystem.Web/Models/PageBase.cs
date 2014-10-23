using EventSystem.Data;
using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;

namespace EventSystem.Web.Models
{
    public class PageBase : Page
    {
        protected IEventSystemData Data { get; set; }
        public User LoggedUser { get; set; }

        public PageBase() : this(new EventSystemData())
        {
        }

        public PageBase(IEventSystemData data)
        {
            this.Data = data;
            var userId  = this.User.Identity.GetUserId();
            this.LoggedUser = this.Data.Users.Find(userId);
        }
    }
}