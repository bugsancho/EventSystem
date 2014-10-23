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

        public IQueryable<EventSystem.Models.Event> ListView1_GetData()
        {
            string idStr = Request.QueryString["q"];

            if (idStr == null)
            {
                return this.Data.Events.All();
            }
            else
            {
                return this.Data.Events.All().Where(e => e.Title.Contains(idStr));
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            var searchWord = this.TextBoxSearch.Text.ToString();

            var query = string.Format("?q={0}", searchWord);
            Response.Redirect("~/Event/ListAllEventsPublic" + query);
        }
    }
}