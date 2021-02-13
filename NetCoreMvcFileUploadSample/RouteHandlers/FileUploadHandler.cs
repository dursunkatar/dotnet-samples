using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace NetCoreMvcFileUploadSample.RouteHandlers
{
    public static class FileUploadHandler
    {
        public static Task Handler(HttpContext context)
        {
            var file = context.Request.Form.Files["file"];
            string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", file.FileName);
            using FileStream fileStream = new FileStream(path, FileMode.Create);
            file.CopyTo(fileStream);
            return context.Response.WriteAsync(file.FileName);
        }
    }
}
