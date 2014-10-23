namespace EventSystem.Data
{
    using System;
    using EventSystem.Data.Repositories;
    using EventSystem.Models;

    public interface IEventSystemData
    {
        IRepository<Venue> Venues { get; }

        IRepository<Event> Events { get; }
        
        IRepository<EventCategory> EventCategories { get; }

        IRepository<User> Users { get; }

        int SaveChanges();
    }
}