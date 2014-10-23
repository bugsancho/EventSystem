using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
        }

        protected void Page_PreRender(object sender, EventArgs e)
        { 
            if (!IsJoined())
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
            return this.Event.Attendants.Contains(this.LoggedUser);
        }

        protected void JoinEventBtn_Click(object sender, EventArgs e)
        {
            this.LoggedUser.Events.Add(this.Event);
            this.Data.SaveChanges();
            this.Event.Attendants.Add(this.LoggedUser);
            this.Data.SaveChanges();
        }

        protected void BtnSubmitComment_Click(object sender, EventArgs e)
        {
            var comment = new Comment();
            comment.Date = DateTime.Now;
            comment.Event = this.Event;
            comment.User = this.LoggedUser;
            comment.Text = this.TextBoxComment.Text;
            this.Data.Comments.Add(comment);
            this.Data.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }
        
        public IQueryable<EventSystem.Models.Comment> CommentsPanel_GetData()
        {
            var comments = this.Data.Events.All()
                               .Where(e => e.Id == this.Event.Id)
                               .Select(e => e.Comments);
            return comments.FirstOrDefault().AsQueryable();
        }
    }
}