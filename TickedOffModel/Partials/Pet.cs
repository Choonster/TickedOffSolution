using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    internal partial class Pet : IPet
    {
        ICollection<IBooking> IPet.Bookings
        {
            get { return Bookings as ICollection<IBooking>; }
        }

        ICustomer IPet.Customer
        {
            get
            {
                return Customer;
            }
            set
            {
                Customer = value as Customer;
            }
        }

        ICollection<IStay> IPet.Stays
        {
            get { return Stays as ICollection<IStay>; }
        }

        public void Update(string name, string species, string breed, DateTime dob, string gender, double weight)
        {
            PetName = name;
            Species = species;
            Breed = breed;
            DOB = dob;
            Gender = gender;
            Weight = weight;
        }
    }
}
