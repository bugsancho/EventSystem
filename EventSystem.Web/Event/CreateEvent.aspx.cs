using EventSystem.Models;
using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Event
{
    public partial class CreateEvent : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void CreateEvent_Click(object sender, EventArgs e)
        {
            // TODO: Implement this method
            throw new NotImplementedException();
        }

        public IQueryable<EventCategory> DropDownListCategories_GetData()
        {
            var data = this.Data.EventCategories.All().ToList().AsQueryable();
            return data;
        }

        public IQueryable<EventSystem.Models.Venue> DropDownListVenues_GetData()
        {
            var data = this.Data.Venues.All().ToList().AsQueryable();
            return data;
        }
    }
}