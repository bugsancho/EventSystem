﻿using EventSystem.Data.Migrations;
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
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<EventSystemContext, Configuration>());
        }

        public static EventSystemContext Create()
        {
            return new EventSystemContext();
        }

        
        public IDbSet<Event> Events { get; set; }

        public IDbSet<Venue> Venues { get; set; }
        
        public IDbSet<EventCategory> EventCategories { get; set; }

        public IDbSet<Comment> Comments { get; set; }
    }
}