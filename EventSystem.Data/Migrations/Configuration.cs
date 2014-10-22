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
    }
}
