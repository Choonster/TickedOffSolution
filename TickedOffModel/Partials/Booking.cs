using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class Booking : IBooking
    {

        IPet IBooking.Pet
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

        IStaff IBooking.Staff
        {
            get
            {
                return Staff;
            }
            set
            {
                Staff = value as Staff;
            }
        }
    }
}
