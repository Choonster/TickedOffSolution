using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class Stay : IStay
    {
        IPet IStay.Pet
        {
            get
            {
                return Pet;
            }
            set
            {
                Pet = value as Pet;
            }
        }
    }
}
