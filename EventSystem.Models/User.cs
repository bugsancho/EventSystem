using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace EventSystem.Models
{
    public class User : IdentityUser
    {
        private ICollection<Event> events;

        public User()
        {
            this.events = new HashSet<Event>();
        }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string ProfileImageUrl { get; set; }

        public string GetProfileImageOrDefault()
        {
            if (String.IsNullOrWhiteSpace(this.ProfileImageUrl))
            {
                return "/Content/Images/profile-default.png";
            }
            return this.ProfileImageUrl;
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