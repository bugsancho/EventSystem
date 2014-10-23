using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EventSystem.Models;
using EventSystem.Data;

namespace EventSystem.Web.Helpers
{
    public class DeletionHelper
    {
        private static IEventSystemData data;

        public static void DeleteEvent(int eventId)
        {
            var ev = data.Events.Find(eventId);
            if (ev == null)
            {
                throw new ArgumentException("Invalid event id!");
            }

            var users = ev.Attendants;
            foreach (var user in users)
            {
                user.Events.Remove(ev);
            }

            var comments = data.Comments.All().Where(c => c.Event.Id == ev.Id);
            foreach (var comment in comments)
            {
                data.Comments.Delete(comment);
            }

            data.Events.Delete(ev);
            data.SaveChanges();
        }

        public static void DeleteVenue(int venueId)
        {
            var venue = data.Venues.Find(venueId);
            if (venue == null)
            {
                throw new ArgumentException("Invalid venue id!");
            }

            var events = venue.Events;
            while (events.Count != 0)
            {
                DeleteEvent(events.First().Id);
            }

            data.Venues.Delete(venue);
            data.SaveChanges();
        }

        static DeletionHelper()
        {
            data = new EventSystemData();
        }
    }
}