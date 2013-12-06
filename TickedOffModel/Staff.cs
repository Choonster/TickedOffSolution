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
    
    internal partial class Staff
    {
        public Staff()
        {
            this.Bookings = new HashSet<Booking>();
        }
    
        public int StaffID { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Email { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Street1 { get; set; }
        public string Street2 { get; set; }
        public string Suburb { get; set; }
        public string StateName { get; set; }
        public string Postcode { get; set; }
        public string Position { get; set; }
    
        internal virtual ICollection<Booking> Bookings { get; set; }
        internal virtual State State { get; set; }
    }
}
