using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Venues
{
    public partial class ListAllVenuesPublic : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<EventSystem.Models.Venue> ListView1_GetData()
        {
            string idStr = Request.QueryString["q"];

            if (idStr == null)
            {
                return this.Data.Venues.All();
            }
            else
            {
                return this.Data.Venues.All().Where(e => e.Name.Contains(idStr));
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            var searchWord = this.TextBoxSearch.Text.ToString();

            var query = string.Format("?q={0}", searchWord);
            Response.Redirect("~/Venues/ListAllVenuesPublic" + query);
        }
    }
}