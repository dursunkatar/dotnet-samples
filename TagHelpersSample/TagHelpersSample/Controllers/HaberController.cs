using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TagHelpersSample.Controllers
{
    public class HaberController : Controller
    {
        public IActionResult Index(string asdaw)
        {
            return View();
        }
    }
}
