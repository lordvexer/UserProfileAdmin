using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TvedcAdmin.Models
{
    [Table("Fiders")]
    public class Fiders1
    {
        public int Id { get; set; }
        [DisplayName("شناسه شهر")]

        public int AddressId { get; set; }
        [DisplayName("شناسه فیدر")]

        public int FiderId { get; set; }
        [DisplayName("شهر")]

        public string RegionName { get; set; }
        [DisplayName("کد فیدر")]

        public string FiderCode { get; set; }
        [DisplayName("آدرس ها")]

        public string Address { get; set; }
        [DisplayName("نام فیدر")]

        public string FiderName { get; set; }

    }
}
