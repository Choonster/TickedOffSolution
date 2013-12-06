using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TickedOffGUI
{
    public static class AboutDialogs
    {
        private static string aboutCompanyText =
            @"Ticked Off is a long-established vet practice that has been operating in the Hornsby area of Sydney for many years. Keith Cabrade, son-in-law of long-term businessman Victor Grahams, owns the magical practice.

Ticked Off has recently received a series of accolades from the industry for their ingenious invention of the easy-tick-disposal product, the Pop Bag. This incredibly clever invention has catapulted Ticked Off to veterinary fame in a way that no bag has done before!

Ticked Off is 100% committed to good service, so hopefully you won't be ticked off... get it?! LOLs. Just a little taste of our witty, vet-flavoured humour.";

        private static string aboutApplicationText =
            @"This is a custom-made application designed specifically to meet the needs of the Ticked Off Vet clinic. It includes features/functions that are regularly accessed by staff members, and serves to make their everyday tasks much easier to fulfil.

Version 2.0 will be out soon... but we won't faucet.";

        public static void AboutCompanyMessageBox()
        {
            MessageBox.Show(aboutCompanyText, "About this company");
        }

        public static void AboutApplicationMessageBox()
        {
            MessageBox.Show(aboutApplicationText, "About this program");
        }
    }
}
