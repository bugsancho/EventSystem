namespace EventSystem.Web.Event
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using EventSystem.Web.Models;
    using System.IO;

    public partial class ListAllEvents : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<EventSystem.Models.Event> ListViewEvent_GetData()
        {
            return this.Data.Events.All().OrderBy(e => e.Title);
        }
    }
}