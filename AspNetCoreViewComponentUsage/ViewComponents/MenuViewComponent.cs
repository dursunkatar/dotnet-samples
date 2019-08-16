using AspNetCoreViewComponentUsage.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspNetCoreViewComponentUsage.ViewComponents
{
    public class MenuViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var menuList = new Menu[] {
                new Menu { Name="Menü 1"},
                new Menu { Name="Menü 2"},
                new Menu { Name="Menü 3"}
            };
            return View(menuList);
        }
    }
}
