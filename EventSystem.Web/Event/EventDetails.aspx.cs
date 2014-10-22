using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using EventSystem.Models;

namespace EventSystem.Web.Event
{
    public partial class EventDetails : PageBase
    {
        private EventSystem.Models.Event Event { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var eventData = new List<EventSystem.Models.Event>() { DetailsViewEvent_GetItem() };
            this.Event = eventData[0];
            Image1.ImageUrl = eventData[0].ImageUrl;

            DetailsViewEvents.DataSource = eventData;
            DetailsViewEvents.DataBind();
            var joined = IsJoined();
            if (!joined)
            {
                this.JoinEventBtn.Visible = true;
            }
            else
            {
                this.JoinEventBtn.Visible = false;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var joined = IsJoined();
            if (!joined)
            {
                this.JoinEventBtn.Visible = true;
                this.BtnSubmitComment.Visible = false;
                this.TextBoxComment.Visible = false;
            }
            else
            {
                this.JoinEventBtn.Visible = false;
                this.BtnSubmitComment.Visible = true;
                this.TextBoxComment.Visible = true;
            }
        }

        public EventSystem.Models.Event DetailsViewEvent_GetItem()
        {
            int id = int.Parse(this.Request["id"]);

            return this.Data.Events.Find(id);
        }

        private bool IsJoined()
        {
            var currentUserId = this.User.Identity.GetUserId();
            var user = this.Data.Users.Find(currentUserId);
            return this.Event.Attendants.Contains(user);
        }

        protected void JoinEventBtn_Click(object sender, EventArgs e)
        {
            var currentUserId = this.User.Identity.GetUserId();
            var user = this.Data.Users.Find(currentUserId);
            user.Events.Add(this.Event);
            this.Data.SaveChanges();
            this.Event.Attendants.Add(user);
            this.Data.SaveChanges();
        }

        protected void BtnSubmitComment_Click(object sender, EventArgs e)
        {
             var currentUserId = this.User.Identity.GetUserId();
            var user = this.Data.Users.Find(currentUserId);

            var comment = new Comment();
            comment.Date = DateTime.Now;
            comment.Event = this.Event;
            comment.User = user;
            comment.Text = this.TextBoxComment.Text;
            this.Data.Comments.Add(comment);
            this.Data.SaveChanges();
        }
    }
}