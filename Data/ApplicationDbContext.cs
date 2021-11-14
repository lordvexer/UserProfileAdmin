using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace TvedcAdmin.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<TvedcAdmin.Models.AboutUs_Contacts> AboutUs_Contacts { get; set; }

        public DbSet<TvedcAdmin.Models.AboutUs_OfficeContacts> AboutUs_OfficeContacts { get; set; }

        public DbSet<TvedcAdmin.Models.AboutUs_OfficeExpert> AboutUs_OfficeExpert { get; set; }

        public DbSet<TvedcAdmin.Models.AboutUs_Record> AboutUs_Records { get; set; }

        public DbSet<TvedcAdmin.Models.Fiders1> Fiders1 { get; set; }
    }
}
