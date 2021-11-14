using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TvedcAdmin.Models
{
    [Table("AboutUs_OfficeExpert")]
    public class AboutUs_OfficeExpert
    {
        public int Id { get; set; }
        [DisplayName("کد مجموعه")]
        public Nullable<int> AssistantId { get; set; }
        [DisplayName("نام")]

        public string Name { get; set; }
        [DisplayName("سمت")]

        public string Role { get; set; }
        [DisplayName("تماس")]

        public string Contact { get; set; }



    }
}
