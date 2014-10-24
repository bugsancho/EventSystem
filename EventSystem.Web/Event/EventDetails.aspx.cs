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
            this.Event = DetailsViewEvent_GetEvent();
            this.ErrorNotifierControl.Visible = false;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var eventData = new List<EventViewModel>() { DetailsViewEvent_GetEventInfo() };            
            Image1.ImageUrl = eventData[0].ImageUrl;

            DetailsViewEvents.DataSource = eventData;
            DetailsViewEvents.DataBind();
            
            this.JoinEventBtn.Visible = CanEventBeJoined(eventData[0]);
            this.BtnSubmitComment.Visible = CanEventBeCommented();
            this.TextBoxComment.Visible = CanEventBeCommented();
        }

        private bool CanEventBeJoined(EventViewModel ev)
        { 
            if (!this.User.Identity.IsAuthenticated)
            {
                return false;
            }
            
            if (ev.TicketsLeft <= 0)
            {
                return false;
            }

            return !IsEventJoinedByCurrentUser();
        }

        private bool CanEventBeCommented()
        {
            if (!this.User.Identity.IsAuthenticated)
            {
                return false;
            }

            return IsEventJoinedByCurrentUser();
        }

        private bool IsEventJoinedByCurrentUser()
        {
            if (this.Event.Host.Id == this.LoggedUser.Id)
            {
                return true;    
            }

            var userEvents = this.LoggedUser.Events;
            foreach (var ev in userEvents)
            {
                if (ev.Id == this.Event.Id)
                {
                    return true;
                }
            }
            return false;
        }

        public EventViewModel DetailsViewEvent_GetEventInfo()
        {
            int id = int.Parse(this.Request["id"]);
            return this.Data.Events.All().Where(x => x.Id == id).Select(x => new EventViewModel
            {
                Title = x.Title,
                Description = x.Description,
                StartDate = x.StartDate,
                EndDate = x.EndDate,
                PurchasedTickets = x.PurchasedTickets,
                TicketsLeft = (x.Venue.AvailableSeats - x.PurchasedTickets),
                Price = x.Price,
                ImageUrl = x.ImageUrl,
                Category = x.Category.Name,
                Host = x.Host.UserName + " (" + x.Host.FirstName + " " + x.Host.LastName + ")",
                HostProfileLink = "~/Account/Profile?id=" + x.Host.Id
            }).FirstOrDefault();
        }

        public EventSystem.Models.Event DetailsViewEvent_GetEvent()
        {
            int id = int.Parse(this.Request["id"]);

            var ev = this.Data.Events.Find(id);
            return ev;
        }

        protected void JoinEventBtn_Click(object sender, EventArgs e)
        {
            this.LoggedUser.Events.Add(this.Event);
            this.Event.PurchasedTickets += 1;
            this.Data.SaveChanges();
            this.Event.Attendants.Add(this.LoggedUser);
            this.Data.SaveChanges();
            Response.Redirect(Request.RawUrl);
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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<EventSystem.Models.User> ListView1_GetData()
        {
            return this.Event.Attendants.AsQueryable();
        }
    }
}