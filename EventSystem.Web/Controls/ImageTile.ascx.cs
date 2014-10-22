namespace EventSystem.Web.Controls
{
    using System;
    using System.Web.UI;

    public partial class ImageTile : UserControl
    {
        public string Info
        {
            get
            {
                return ViewState["Info"].ToString();
            }
            set
            {
                ViewState["Info"] = value;
            }
        }

        public string ImageUrl
        {
            get
            {
                return ViewState["ImageUrl"].ToString();
            }
            set
            {
                ViewState["ImageUrl"] = value;
            }
        }

        public string Target
        {
            get
            {
                return ViewState["TargetUrl"].ToString();
            }
            set
            {
                ViewState["TargetUrl"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ImageTile_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Target);
        }
    }
}