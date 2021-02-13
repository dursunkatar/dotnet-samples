using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CustomRouteHandlerSample.RouteHandlers
{
    public static class ExampleRouteHandler
    {
        public static RequestDelegate Handler() => async context => await context.Response.WriteAsync("Merhaba");
    }
}
