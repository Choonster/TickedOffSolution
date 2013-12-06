using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TickedOffGUI
{
    public partial class MenuStrip : UserControl
    {
        public MenuStrip()
        {
            InitializeComponent();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void aboutThisCompanyToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutDialogs.AboutCompanyMessageBox();
        }

        private void aboutThisApplicationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AboutDialogs.AboutApplicationMessageBox();
        }
    }
}
