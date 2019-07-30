using System;

namespace MultiThreadWorks
{
    class Program
    {
        static void Main(string[] args)
        {
            var connectManager = new ConnectManager();
            connectManager.Count = 5;

            Console.WriteLine("Waiting for list..\n");
            var list = connectManager.GetList();

            foreach (var item in list)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine("\nFinish");
            Console.Read();
        }
    }
}
