using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventSystem.Web.Controls
{
    public partial class ErrorNotifier : System.Web.UI.UserControl
    {
        public string ErrorMessageText { get; set; }
        // public string ErrorMessageText
        //{
        //    get
        //    {
        //        return ViewState["ErrorMessageText"].ToString();
        //    }
        //    set
        //    {
        //        ViewState["ErrorMessageText"] = value;
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}