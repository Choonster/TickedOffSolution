//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TickedOffModel
{
    using System;
    using System.Collections.Generic;
    
    internal partial class Booking
    {
        public int BookingID { get; set; }
        public Nullable<int> PetID { get; set; }
        public Nullable<int> StaffID { get; set; }
        public Nullable<System.DateTime> BookingDateTime { get; set; }
        public string Symptoms { get; set; }
        public string Treatments { get; set; }
        public string Notes { get; set; }
    
        internal virtual Pet Pet { get; set; }
        internal virtual Staff Staff { get; set; }
    }
}
