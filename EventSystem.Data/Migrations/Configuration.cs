namespace EventSystem.Data.Migrations
{
    using EventSystem.Models;
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
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            IList<EventCategory> defaultCategories = new List<EventCategory>();

            defaultCategories.Add(new EventCategory() { Name = "Theatre" });
            defaultCategories.Add(new EventCategory() { Name = "Concert" });
            defaultCategories.Add(new EventCategory() { Name = "Birthday" });
            defaultCategories.Add(new EventCategory() { Name = "Sport" });
        }
    }
}
