using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class State : IState
    {
        ICollection<ICustomer> IState.Customers
        {
            get
            {
                return Customers as ICollection<ICustomer>;
            }
        }

        ICollection<IStaff> IState.Staff
        {
            get
            {
                return Staff as ICollection<IStaff>;
            }
        }
    }
}
