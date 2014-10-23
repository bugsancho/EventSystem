using EventSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventSystem.Web.Models
{
    public class EventViewModel
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public string Category { get; set; }

        public int PurchasedTickets { get; set; }

        public int TicketsLeft { get; set; }

        public decimal Price { get; set; }

        public string ImageUrl { get; set; }

        public string Host { get; set; }

        public string HostProfileLink { get; set; }
    }
}