using System;
namespace TickedOffModel
{
    public interface IStay
    {
        IPet Pet { get; set; }
        decimal? StayCost { get; set; }
        DateTime? StayEndDate { get; set; }
        int StayID { get; set; }
        DateTime? StayStartDate { get; set; }
    }
}
