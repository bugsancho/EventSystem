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
            
            Console.WriteLine();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<EventSystem.Models.User> GridView1_GetData()
        {
            var users = this.Data.Users.All();
            return users;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_UpdateItem(string id)
        {
            EventSystem.Models.User item = this.Data.Users.Find(id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                this.Data.SaveChanges();
            }
        }
    }
}