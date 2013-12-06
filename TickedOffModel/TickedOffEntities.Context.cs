﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TickedOffModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    internal partial class TickedOffDBEntities : DbContext
    {
        public TickedOffDBEntities()
            : base("name=TickedOffDBEntities")
        {
            this.Configuration.LazyLoadingEnabled = false;
        Bookings = Set<TickedOffModel.Booking>();
        Customers = Set<TickedOffModel.Customer>();
        Pets = Set<TickedOffModel.Pet>();
        Staffs = Set<TickedOffModel.Staff>();
        States = Set<TickedOffModel.State>();
        Stays = Set<TickedOffModel.Stay>();
        Inventories = Set<TickedOffModel.Inventory>();
    
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        internal DbSet<Booking> Bookings { get; set; }
        internal DbSet<Customer> Customers { get; set; }
        internal DbSet<Pet> Pets { get; set; }
        internal DbSet<Staff> Staffs { get; set; }
        internal DbSet<State> States { get; set; }
        internal DbSet<Stay> Stays { get; set; }
        public DbSet<Inventory> Inventories { get; set; }
    }
}
