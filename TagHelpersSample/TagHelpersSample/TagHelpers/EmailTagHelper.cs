using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TagHelpersSample.TagHelpers
{
    public class EmailTagHelper : TagHelper
    {
        public string Mail { get; set; }
        public string Display { get; set; }

        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            output.TagName = "a";
            output.Attributes.Add("href", $"mailto:{Mail}");
            output.Content.Append(Display);
        }
    }
}
