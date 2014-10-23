using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EventSystem.Models
{
    public class Venue
    {
        private ICollection<Event> events;

        public int Id { get; set; }

        public string Name { get; set; }

        public string Location { get; set; }

        public int AvailableSeats { get; set; }

        public string ImageUrl { get; set; }

        public virtual User Host { get; set; }

        public Venue()
        {
            this.events = new HashSet<Event>();
        }

        public virtual ICollection<Event> Events
        {
            get
            {
                return this.events;
            }
            set
            {
                this.events = value;
            }
        }
    }
}