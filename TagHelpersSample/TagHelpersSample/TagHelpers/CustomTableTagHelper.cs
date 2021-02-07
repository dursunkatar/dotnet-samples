using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TagHelpersSample.TagHelpers
{
    public class CustomTableTagHelper : TagHelper
    {
        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            output.TagName = "div";
            var sb = new StringBuilder();
            sb.Append(@"<table border='1'>
                        <thead>
                            <tr>
                                <th>isim</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>dursun</td>
                            </tr>
                        </tbody>
                    </table>");
            output.Content.SetHtmlContent(sb.ToString());
        }
    }
}
