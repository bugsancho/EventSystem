using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventSystem.Web.Startup))]
namespace EventSystem.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
