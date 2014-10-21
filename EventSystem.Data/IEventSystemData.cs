namespace EventSystem.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using EventSystem.Data.Repositories;
    using EventSystem.Models;

    public interface IEventSystemData
    {
        IRepository<Venue> Venues { get; }

        IRepository<Event> Events { get; }

        IRepository<User> Users { get; }

        int SaveChanges();
    }
}