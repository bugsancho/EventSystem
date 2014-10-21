using EventSystem.Data.Migrations;
using EventSystem.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventSystem.Data
{
    public class EventSystemContext : IdentityDbContext<User>
    {
        public EventSystemContext() : base("DefaultConnection", throwIfV1Schema: false)
        {
          //  Database.SetInitializer(new DropCreateDatabaseIfModelChanges<EventSystemContext>());
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<EventSystemContext, Configuration>());
        }

        public static EventSystemContext Create()
        {
            return new EventSystemContext();
        }

        IDbSet<Event> Events { get; set; }

        IDbSet<Venue> Venues { get; set; }
    }
}