using System;
namespace TickedOffModel
{
    public interface IInventory
    {
        string ItemDescription { get; set; }
        int ItemID { get; set; }
        string ItemName { get; set; }
        int NumberOnHand { get; set; }
        int NumberOnOrder { get; set; }
    }
}
