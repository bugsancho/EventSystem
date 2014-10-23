using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web
{
    public partial class _Default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<EventSystem.Models.Venue> VenueImagesContainer_GetData()
        {
            return this.Data.Venues.All().Take(4);
        }

        public IEnumerable<EventSystem.Models.Event> EventImagesContainer_GetData()
        {
            DateTime currentDate = DateTime.Now;
            return this.Data.Events.All().Where(d => d.EndDate >= currentDate).Take(4);
        }
    }
}