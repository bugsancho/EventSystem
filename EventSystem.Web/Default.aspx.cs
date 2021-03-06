﻿using EventSystem.Web.Models;
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
            const string ActiveEvents = "activeEventsCount";
            if (Cache[ActiveEvents] != null)
            {
                this.ActiveEvents.Text = "Upcoming events: " + Cache[ActiveEvents].ToString();
            }
            else
            {
                DateTime currentDate = DateTime.Now;
                var activeEventsCount = this.Data.Events.All().Where(d => d.EndDate >= currentDate).OrderBy(d => d.StartDate).Count();
                Cache.Insert(ActiveEvents, activeEventsCount, null, DateTime.Now.AddSeconds(60), TimeSpan.Zero);

                this.ActiveEvents.Text = "Upcoming events: " + activeEventsCount;
            }
        }

        public IEnumerable<EventSystem.Models.Venue> VenueImagesContainer_GetData()
        {
            return this.Data.Venues.All().Take(4);
        }

        public IEnumerable<EventSystem.Models.Event> EventImagesContainer_GetData()
        {
            DateTime currentDate = DateTime.Now;
            return this.Data.Events.All().Where(d => d.EndDate >= currentDate).OrderBy(d => d.StartDate).Take(4);
        }
    }
}