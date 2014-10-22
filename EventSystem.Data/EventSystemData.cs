namespace EventSystem.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using EventSystem.Models;
    using EventSystem.Data.Repositories;

    public class EventSystemData : IEventSystemData  
    {
        private DbContext context;
        private IDictionary<Type, object> repositories;

        public EventSystemData()
            : this(new EventSystemContext())
        {
        }

        public EventSystemData(DbContext context)
        {
            this.context = context;
            this.repositories = new Dictionary<Type, object>();
        }

        public IRepository<Venue> Venues
        {
            get
            {
                return this.GetRepository<Venue>();
            }
        }

        public IRepository<Event> Events
        {
            get
            {
                return this.GetRepository<Event>();
            }
        }

        public IRepository<User> Users 
        {
            get
            {
                return this.GetRepository<User>();
            }
        }

        public IRepository<EventCategory> EventCategories
        {
            get
            {
                return this.GetRepository<EventCategory>();
            }
        }

        public int SaveChanges()
        {
            return this.context.SaveChanges();
        }

        private IRepository<T> GetRepository<T>() where T : class
        {
            var typeOfRepository = typeof(T);
            if (!this.repositories.ContainsKey(typeOfRepository))
            {
                var newRepository = Activator.CreateInstance(typeof(EFRepository<T>), context);
                this.repositories.Add(typeOfRepository, newRepository);
            }

            return (IRepository<T>)this.repositories[typeOfRepository];
        }
    }
}