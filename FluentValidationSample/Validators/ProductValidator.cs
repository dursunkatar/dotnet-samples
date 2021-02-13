using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FluentValidationSample.Models;

namespace FluentValidationSample.Validators
{
    public class ProductValidator : AbstractValidator<Product>
    {
        public ProductValidator()
        {
            RuleFor(x => x.ProductName)
                .NotNull()
                .NotEmpty()
                .WithMessage("Product Name");

            RuleFor(x => x.ProductName)
                .MaximumLength(100)
                .WithMessage("Maximum 100 karakter olabilir");

            RuleFor(x => x.Email)
                .EmailAddress()
                .WithMessage("Doğru formatta email giriniz");

            RuleFor(x => x.Email)
                .NotNull()
                .NotEmpty()
                .WithMessage("Email alanı boş olamaz");
        }
    }
}
