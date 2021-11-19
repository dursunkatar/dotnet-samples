//Startup
namespace MvcIdentityExample.App_Start
{
    public class StartupAuth
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });
        }
    }
    
//Login Controller
namespace MvcIdentityExample.Controllers
{
    [Authorize(Roles = "admin")]
    public class AccountController : Controller
    {
        // GET: Account
        public string Index()
        {
            var ss = AuthenticationManager.User.Identity.Name;
            return "oldu";
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public string Login(string role)
        {
            ClaimsIdentity identity = new ClaimsIdentity(DefaultAuthenticationTypes.ApplicationCookie);
            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, "falan filan"));
            identity.AddClaim(new Claim(ClaimTypes.Name, "dursun"));
            identity.AddClaim(new Claim(ClaimTypes.Role, role));
            AuthenticationManager.SignIn(identity);

            return "bi dene baakim";
        }

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }
    }
}

//WebConfig
  <appSettings>
    <add key="owin:AppStartup" value="MvcIdentityExample.App_Start.StartupAuth"/>
  </appSettings>
 
 //Nuget
 Microsoft.AspNet.Identity.Owin
 Microsoft.Owin.Host.SystemWeb
