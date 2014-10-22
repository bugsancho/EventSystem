using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Event
{
    public partial class EventDetails : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public EventSystem.Models.Event DetailsViewEvent_GetItem()
        {
            int id = int.Parse(this.Request["id"]);

            return this.Data.Events.Find(id);
        }
    }
}