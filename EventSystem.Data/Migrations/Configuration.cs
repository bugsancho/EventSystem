namespace EventSystem.Data.Migrations
{
    using EventSystem.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<EventSystemContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
            ContextKey = "EventSystem.Data.EventSystemContext";
        }

        protected override void Seed(EventSystemContext context)
        {
            SeedAdminUser(context);
                
            if (!context.EventCategories.Any())
            {
                IList<EventCategory> defaultCategories = new List<EventCategory>();

                defaultCategories.Add(new EventCategory() { Name = "Theatre" });
                defaultCategories.Add(new EventCategory() { Name = "Concert" });
                defaultCategories.Add(new EventCategory() { Name = "Birthday" });
                defaultCategories.Add(new EventCategory() { Name = "Sport" });

                foreach (EventCategory eventCat in defaultCategories)
                    context.EventCategories.Add(eventCat);
            }
        }

        private void SeedAdminUser(EventSystemContext context)
        {
            // Access the application context and create result variables.
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            var roleStore = new RoleStore<IdentityRole>(context);

            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            if (!roleMgr.RoleExists("admin"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "admin" });
            }

            var userMgr = new UserManager<User>(new UserStore<User>(context));

            var appUser = new User
            {
                UserName = "admin@ticketsystem.com",
                Email = "admin@ticketsystem.com"
            };

            IdUserResult = userMgr.Create(appUser, "administrator");

            if (!userMgr.IsInRole(userMgr.FindByEmail("admin@ticketsystem.com").Id, "admin"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("admin@ticketsystem.com").Id, "admin");
            }
        }
    }
}