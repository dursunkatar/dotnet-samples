using System;
using System.Net;
using System.Text;

namespace WebClientProxyUsage
{
    class Program
    {
        static void Main(string[] args)
        {
            bool isWork = connect("87.226.213.120", 8080);
            Console.WriteLine(isWork ? "it is work :)" : "it is not work :(");
            Console.ReadKey(true);
        }

        static bool connect(string ipadress, int port)
        {
            try
            {
                ICredentials credentials = CredentialCache.DefaultCredentials;
                IWebProxy proxy = new WebProxy(ipadress, port);
                proxy.Credentials = credentials;

                using (var wc = new WebClient())
                {
                    wc.Proxy = proxy;
                    wc.Encoding = Encoding.UTF8;
                    wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0");
                    string result = wc.DownloadString("http://www.ipsorgu.com/");
                    return result.Contains(ipadress);
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
