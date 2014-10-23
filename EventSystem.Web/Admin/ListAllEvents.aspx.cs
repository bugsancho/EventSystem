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
    using EventSystem.Web.Helpers;

    public partial class ListAllEvents : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.errorBox.Visible = false;
        }

        public IQueryable<EventSystem.Models.Event> ListViewEvents_GetData()
        {
            return this.Data.Events.All().OrderBy(e => e.Title);
        }

        public void ListViewEvents_UpdateItem(int id)
        {
            EventSystem.Models.Event item = null;
            item = this.Data.Events.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);

            const string ImagePath = "~/Content/Images/Event/";

            var listViewItem = ListViewEvents.EditItem;
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

        public void ListViewEvents_DeleteItem(int id)
        {
            EventSystem.Models.Event item = null;
            item = this.Data.Events.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Venue with id {0} was not found", id));
                return;
            }
            DeletionHelper.DeleteEvent(item.Id);
        }
    }
}