using EventSystem.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Admin
{
    public partial class Users : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<EventSystem.Models.User> ListView1_GetData()
        {
            var users = this.Data.Users.All();
            return users;
        }
        
        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(string id)
        {
            EventSystem.Models.User item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = this.Data.Users.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("User with id {0} was not found", id));
                return;
            }

            this.Data.Users.Delete(item);
            this.Data.SaveChanges();
        }

        public void ListView1_UpdateItem(string id)
        {
            EventSystem.Models.User item = null;
            item = this.Data.Users.Find(id);

            if (item == null)
            {
                ModelState.AddModelError("", String.Format("User with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.Data.SaveChanges();
            }
        }
    }
}