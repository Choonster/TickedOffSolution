using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class Staff : IStaff
    {
        ICollection<IBooking> IStaff.Bookings
        {
            get
            {
                return Bookings as ICollection<IBooking>;
            }
        }

        IState IStaff.State
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }
    }
}
