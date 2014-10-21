
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EventSystem.Web.Models;

namespace EventSystem.Web.Venue
{
    public partial class CreateVenue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;
        }

        protected void CreateVenue_Click(object sender, EventArgs e)
        {
            EventSystem.Models.Venue newVenie = new EventSystem.Models.Venue();
            newVenie.Name = this.Name.Text;
            newVenie.Location = this.Location.Text;
            newVenie.AvailableSeats = int.Parse(this.AvailableSeats.Text);

            this.Data.Venues.Add(newVenie);
            this.Data.SaveChanges();
            Response.Redirect("/");
        }
    }
}