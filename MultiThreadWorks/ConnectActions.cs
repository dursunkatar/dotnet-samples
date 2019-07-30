using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MultiThreadWorks
{
    public class Connect
    {
        public delegate void CallBack(string result);

        public string AppName { get; set; }
        public int Second { get; set; }

        public void Start(CallBack func)
        {
            Thread.Sleep(500 * Second);
            func(AppName);
        }
    }

    public class ConnectManager
    {
        private static volatile object _obj = new object();
        private static List<string> _liste;
        public int Count { get; set; }

        static ConnectManager()
        {
            _liste = new List<string>();
        }

        private void callBack(string result)
        {
            lock (_obj)
            {
                _liste.Add(result);
            }
        }

        private bool isFinish()
        {
            lock (_obj)
            {
                return _liste.Count == Count;
            }
        }

        private void startConnect(int i)
        {
            Task.Run(() =>
            {
                var _con = new Connect
                {
                    AppName = "app-" + i + " connected!",
                    Second = i
                };
                _con.Start(callBack);
            });
        }
        public IEnumerable<string> GetList()
        {
            for (int i = 1; i <= Count; i++)
            {
                startConnect(i);
            }
            while (!isFinish()) ;
            return _liste;
        }
    }

}
