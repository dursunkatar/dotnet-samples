using AspNetMvcValidation.CustomValidations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspNetMvcValidation.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        [Display(Name = "Product Name")]
        [Required(ErrorMessage = "İsim alanı boş geçilemez")]
        [StringLength(maximumLength: 5, ErrorMessage = "2 karakterden küçük 5 karakterden büyük olamaz", MinimumLength = 2)]
        public string ProductName { get; set; }

        [TcControl(ErrorMessage = "loo olmadı")]
        public string Dec { get; set; }

        public string Password { get; set; }

        [Compare("Password")]
        public string ConfirmPassword { get; set; }

        [EmailAddress()]
        public string EmailAdress { get; set; }
        public byte Stock { get; set; }

        [RegularExpression(@"^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$",ErrorMessage ="Adam akıllı bir mail gir")]
        public string CEmail { get; set; }
    }
}