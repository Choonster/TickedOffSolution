using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TickedOffModel
{
    // Public facade of the model
    public class TickedOffFacade : IDisposable
    {
        private TickedOffEntities _context;

        public TickedOffFacade()
        {
            _context = new TickedOffEntities();
        }

        public IEnumerable<IBooking> Bookings
        {
            get
            {
                return _context.Bookings;
            }
        }

        public IEnumerable<IPet> Pets
        {
            get
            {
                return _context.Pets;
            }
        }

        public IPet FetchPet(int id)
        {
            return Pets.Single(pet => pet.PetID == id);
        }

        public void UpdatePet(int id, string name, string species, string breed, DateTime dob, string gender, double weight)
        {
            var pet = FetchPet(id) as Pet;
            pet.Update(name, species, breed, dob, gender, weight);
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }

        private void Foo()
        {
           
        }
    }
}
