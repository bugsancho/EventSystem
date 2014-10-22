using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EventSystem.Models
{
    public class Event
    {
        private ICollection<User> attendants;
        private ICollection<Comment> comments;

        public int Id { get; set; }
        
        public string Title { get; set; }

        public string Description { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public Venue Venue { get; set; }

        public EventCategory Category { get; set; }

        public int PurchasedTickets { get; set; }

        public User Host { get; set; }

        public Decimal Price { get; set; }

        public Event()
        {
            this.attendants = new HashSet<User>();
            this.comments = new HashSet<Comment>();
        }

        public virtual ICollection<User> Attendants
        {
            get
            {
                return this.attendants;
            }
            set
            {
                this.attendants = value;
            }
        }
         public virtual ICollection<Comment> Comments
        {
            get
            {
                return this.comments;
            }
            set
            {
                this.comments = value;
            }
        }

        public string ImageUrl { get; set; }
    }
}