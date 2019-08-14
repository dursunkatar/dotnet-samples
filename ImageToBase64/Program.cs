using System;
using System.IO;

namespace ImageToBase64
{
    class Program
    {
        static void Main(string[] args)
        {
            byte[] imageArray = File.ReadAllBytes("C:\image.jpg");
            string base64ImageRepresentation = Convert.ToBase64String(imageArray);
            Console.WriteLine(base64ImageRepresentation);
            Console.ReadKey(true);
        }
    }
}
