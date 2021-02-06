using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspNetMvcValidation.CustomValidations
{
    public class TcControlAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            return value != null && value.ToString() != "a";
        }
    }
}