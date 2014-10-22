using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EventSystem.Web.Models;

namespace EventSystem.Web.Venues
{
    public partial class VenueDetails : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public EventSystem.Models.Venue DetailsViewVenue_GetItem()
        {
            int id = int.Parse(this.Request["id"]);
            
            return this.Data.Venues.Find(id);
        }

   
    }
}