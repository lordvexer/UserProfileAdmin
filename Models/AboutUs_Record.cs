using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;


namespace TvedcAdmin.Models
{
    [Table("AboutUs_Record")]
    public class AboutUs_Record
    {
        public int Id { get; set; }
        [DisplayName("کد مجموعه")]

        public Nullable<int> AssistantId { get; set; }
        [DisplayName("سوابق اجرایی")]

        public string Name { get; set; }
        [DisplayName("تاریخ ها")]

        public string Years { get; set; }


    }
}
