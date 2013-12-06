using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TickedOffModel;

namespace TickedOffGUI
{
    public partial class MainMenu : Form
    {
        private TickedOffFacade _facade;
        private ManagePetInfo _managePetInfo;

        public MainMenu()
        {
            InitializeComponent();

            _facade = new TickedOffFacade();

            FormClosed += (sender, eventArgs) => Application.Exit();
        }

        private void managePetInfoButton_Click(object sender, EventArgs e)
        {
            if (_managePetInfo != null)
            {
                _managePetInfo.Activate();
            }
            else
            {
                _managePetInfo = new ManagePetInfo(_facade);
                _managePetInfo.FormClosed += (eventSender, eventArgs) => _managePetInfo = null;
                _managePetInfo.Show();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }

            _facade.Dispose();
            base.Dispose(disposing);
        }
    }
}
