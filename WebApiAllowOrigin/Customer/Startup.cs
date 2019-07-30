using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;

namespace Customer
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddRouting();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            var routerBuilder = new RouteBuilder(app);

            routerBuilder.MapGet("",context => {

                return context.Response.WriteAsync(@"
                               <!DOCTYPE html>
                               <html xmlns=""http://www.w3.org/1999/xhtml"">
                                <head>
                                  <meta charset=""utf-8""/>
                                  <title>Kişi Listesi</title>
                                </head>
                                <body>
 
                                  <div>
                                    <h2>Kişileri Getir</h2>
                                    <ul id=""values"" />
                                  </div>
                                  <div>    
                                    <input type=""button"" value=""Getir"" onclick=""getValues();"" />
                                    <p id=""Contoso"" />
                                  </div>
 
                                  <script src=""https://code.jquery.com/jquery-3.2.1.js""></script>
                                  <script>
   
                                    function getValues() {
                                      var uri = 'http://localhost:8080/api/values';
                                      $('#values').empty();
       
                                      $.getJSON(uri)
                                      .done(function (data) {
                                        $.each(data, function (key, value) {              
                                          $('<li>', { text: value}).appendTo($('#values'));
                                        });
                                      });
                                    }
     
                                  </script>
                                </body>
                                </html>
                              ");
            });

            app.UseRouter(routerBuilder.Build());
        }
    }
}
