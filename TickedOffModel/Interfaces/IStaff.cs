using System;
namespace TickedOffModel
{
    public interface IStaff
    {
        System.Collections.Generic.ICollection<IBooking> Bookings { get; }
        DateTime? DOB { get; set; }
        string Email { get; set; }
        string FirstName { get; set; }
        string Gender { get; set; }
        string LastName { get; set; }
        string Phone1 { get; set; }
        string Phone2 { get; set; }
        string Position { get; set; }
        string Postcode { get; set; }
        int StaffID { get; set; }
        IState State { get; set; }
        string Street1 { get; set; }
        string Street2 { get; set; }
        string Suburb { get; set; }
        string Title { get; set; }
    }
}
