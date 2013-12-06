using System;
namespace TickedOffModel
{
    public interface ICustomer
    {
        int CustomerID { get; set; }
        DateTime? DOB { get; set; }
        string Email { get; set; }
        string FirstName { get; set; }
        string Gender { get; set; }
        string LastName { get; set; }
        System.Collections.Generic.ICollection<IPet> Pets { get; }
        string Phone1 { get; set; }
        string Phone2 { get; set; }
        string Postcode { get; set; }
        IState State { get; set; }
        string Street1 { get; set; }
        string Street2 { get; set; }
        string Suburb { get; set; }
        string Title { get; set; }
    }
}
