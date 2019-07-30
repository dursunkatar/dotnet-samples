using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace RouterSamples
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
           .UseKestrel()
           .UseUrls("http://localhost:8085")
           .UseStartup<BoosterV2>()
           .Build();
            host.Run();
        }
    }

    class Booster
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRouting();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            var routBuilder = new RouteBuilder(app);

            routBuilder.MapGet("", (context) =>
            {
                context.Response.Headers.Add("Content-Type", "text/plain; charset=utf8");
                return context.Response.WriteAsync("Hoş Geldin Paşam :)");
            });

            routBuilder.MapGet("profil/ben", (context) =>
            {
                context.Response.Headers.Add("Content-Type", "text/plain; charset=utf8");
                return context.Response.WriteAsync("Beni Yakaladın :)");
            });

            routBuilder.MapGet("neicersin/{icecek=kapiçino}", (context) =>
            {
                var values = context.GetRouteData().Values;
                context.Response.Headers.Add("Content-Type", "text/html; charset=utf-8");
                return context.Response.WriteAsync($"Maalesef <h2>{values["icecek"]}</h2> kalmadı :(");
            });

            routBuilder.MapGet("/arkadaslar", (context) =>
            {
                context.Response.Headers.Add("Content-Type", "application/json");
                var friends = File.ReadAllText("friends.json");
                return context.Response.WriteAsync(friends);
            });
            app.UseRouter(routBuilder.Build());
        }
    }

    class BoosterV2
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRouting();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            var handler = new RouteHandler(context =>
            {
                var routeValues = context.GetRouteData().Values;
                var path = context.Request.Path;
                if (path == "/arkadaslar")
                {
                    context.Response.Headers.Add("Content-Type", "application/json");
                    var books = File.ReadAllText("friends.json");
                    return context.Response.WriteAsync(books);
                }

                return context.Response.WriteAsync(@"
                                <!DOCTYPE html>
                                <html lang=""tr"">
                                  <head>
                                    <meta charset=""UTF-8"" />
                                    <meta name=""viewport"" content=""width=device-width, initial-scale=1.0"" />
                                    <meta http-equiv=""X-UA-Compatible"" content=""ie=edge"" />
                                    <title>Dursun Katar</title>
                                  </head>
                                  <body>
                                    <h1 style=""text-align: center;"">Hoş Geldin Dostum :)</h1>
                                  </body>
                                </html>
                               ");
            });
            app.UseRouter(handler);
        }
    }
}
