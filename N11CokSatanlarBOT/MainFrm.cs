using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace N11CokSatanlar
{
    public partial class MainFrm : Form
    {
        ChromeDriver driver;
        public MainFrm()
        {
            InitializeComponent();

            CheckForIllegalCrossThreadCalls = false;
            var service = ChromeDriverService.CreateDefaultService();
            service.HideCommandPromptWindow = true;
            driver = new ChromeDriver(service);
            driver.Navigate().GoToUrl("https://www.n11.com/cok-satanlar");
            var urunAdlari = driver.FindElementsByCssSelector("h3.productName"); ;
            var urunFiyatlari = driver.FindElementsByCssSelector("div.proDetail ins");

            for (int i = 0; i < urunAdlari.Count; i++)
            {
                txtUrunler.AppendText(urunAdlari[i].Text + " ( " + urunFiyatlari[i].Text + " )" + Environment.NewLine + Environment.NewLine);
            }
        }

        private void MainFrm_FormClosing(object sender, FormClosingEventArgs e)
        {
            driver.Quit();
        }
    }
}
