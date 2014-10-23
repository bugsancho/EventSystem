
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EventSystem.Web.Models;

namespace EventSystem.Web.Venues
{
    public partial class ListAll : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<EventSystem.Models.Venue> ListViewVenues_GetData()
        {
            return this.Data.Venues.All().OrderBy(v => v.Name);
        }
    }
}