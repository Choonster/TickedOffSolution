using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class Customer : ICustomer
    {

        ICollection<IPet> ICustomer.Pets
        {
            get { return Pets as ICollection<IPet>; }
        }

        IState ICustomer.State
        {
            get
            {
                return State;
            }
            set
            {
                State = value as State;
            }
        }

        public override string ToString()
        {
            return String.Format("{0}, {1}", FirstName, LastName);
        }
    }
}
