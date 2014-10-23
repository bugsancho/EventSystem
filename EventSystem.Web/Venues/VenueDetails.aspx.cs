using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EventSystem.Web.Models;
using System.IO;

namespace EventSystem.Web.Venues
{
    public partial class VenueDetails : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public object FormViewVenue_GetItem()
        {
            int id = int.Parse(this.Request["id"]);

            return this.Data.Venues.Find(id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FormViewVenue_UpdateItem(int id)
        {
            EventSystem.Models.Venue item = null;
            item = this.Data.Venues.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);

            // get uploaded file
            const string ImagePath = "/Content/Images/Venue/";
            string imageUrl = "";

            FileUpload fileUploadControl = FormViewVenue.FindControl("FileUploadControl") as FileUpload;

            string fileExtention = Path.GetExtension(fileUploadControl.FileName);
            imageUrl = ImagePath + id + fileExtention;
            fileUploadControl.SaveAs(Server.MapPath("~" + ImagePath) + id + fileExtention);

            item.ImageUrl = imageUrl;

            if (ModelState.IsValid)
            {
                this.Data.SaveChanges();
            }
        }
    }
}