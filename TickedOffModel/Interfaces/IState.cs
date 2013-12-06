using System;
namespace TickedOffModel
{
    public interface IState
    {
        System.Collections.Generic.ICollection<ICustomer> Customers { get;  }
        System.Collections.Generic.ICollection<IStaff> Staff { get; }
        string Name { get; set; }
    }
}
