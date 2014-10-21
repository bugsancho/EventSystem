using EventSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace EventSystem.Web.Models
{
    public class PageBase : Page
    {
        protected IEventSystemData Data { get; set; }

        public PageBase() : this(new EventSystemData())
        {
        }

        public PageBase(IEventSystemData data)
        {
            this.Data = data;
        }
    }
}