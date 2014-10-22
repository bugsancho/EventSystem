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

        public IEnumerable<EventSystem.Models.Venue> EventImagesContainer_GetData()
        {
             return this.Data.Venues.All();
        }
    }
}