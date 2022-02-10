using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ASPFinalProject_Mehedee.Startup))]
namespace ASPFinalProject_Mehedee
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
