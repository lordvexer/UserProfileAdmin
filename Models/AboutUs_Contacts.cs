using System;
using System.Collections.Generic;
using System.ComponentModel;

using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TvedcAdmin.Models
{
    [Table("AboutUs_Contact")]
    public class AboutUs_Contacts
    {
        
        public int Id { get; set; }

        [DisplayName("کد مجموعه")]
        public Nullable<int> AssistantId { get; set; }
        [DisplayName("عنوان")]
        public string Name { get; set; }

        [DisplayName("محتوا")]
        public string Value { get; set; }   

    }
}
