using System;
namespace TickedOffModel
{
    public interface IBooking
    {
        DateTime? BookingDateTime { get; set; }
        int BookingID { get; set; }
        string Notes { get; set; }
        IPet Pet { get; set; }
        IStaff Staff { get; set; }
        string Symptoms { get; set; }
        string Treatments { get; set; }
    }
}
