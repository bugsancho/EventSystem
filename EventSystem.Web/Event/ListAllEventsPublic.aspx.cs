using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Event
{
    public partial class ListAllEventsPublic : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<EventSystem.Models.Event> EventImagesContainer_GetData()
        {
            return this.Data.Events.All();
        }
    }
}