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
    public partial class ListAll : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;
        }

        public IQueryable<EventSystem.Models.Venue> ListViewVenues_GetData()
        {
            return this.Data.Venues.All().OrderBy(v => v.Name);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewVenues_UpdateItem(int id)
        {
            EventSystem.Models.Venue item = null;
            item = this.Data.Venues.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Venue with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);

            const string ImagePath = "~/Content/Images/Venue/";

            //FileUpload fileUploadControl = ListViewVenues.FindControl("FileUploadControl") as FileUpload;
            var listViewItem = ListViewVenues.EditItem;
            var fileUploadControl = listViewItem.FindControl("FileUploadControl") as FileUpload;

            if (fileUploadControl != null)
            {
                string fileExtention = Path.GetExtension(fileUploadControl.FileName);
                fileUploadControl.SaveAs(Server.MapPath(ImagePath) + id + fileExtention);
            }            

            if (ModelState.IsValid)
            {
                this.Data.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewVenues_DeleteItem(int id)
        {
            EventSystem.Models.Venue item = null;
            item = this.Data.Venues.Find(id);

            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Venue with id {0} was not found", id));
                return;
            }

            this.Data.Venues.Delete(item);
            this.Data.SaveChanges();
        }        
    }
}