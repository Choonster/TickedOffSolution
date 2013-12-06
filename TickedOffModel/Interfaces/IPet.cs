using System;
namespace TickedOffModel
{
    public interface IPet
    {
        int PetID { get; set; }
        System.Collections.Generic.ICollection<IBooking> Bookings { get; }
        string Breed { get; set; }
        ICustomer Customer { get; set; }
        DateTime? DOB { get; set; }
        string Gender { get; set; }
        string PetName { get; set; }
        string Species { get; set; }
        System.Collections.Generic.ICollection<IStay> Stays { get; }
        double? Weight { get; set; }
    }
}
