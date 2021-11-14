using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TvedcAdmin.Models
{
    [Table("AboutUs_OfficeContact")]
    public class AboutUs_OfficeContacts
    {
        public int Id { get; set; }
        [DisplayName("دفتر")]

        public string OfficeName { get; set; }
        [DisplayName("مدیر")]

        public string Manager { get; set; }
        [DisplayName("تاریخ تولد")]

        public string BirthDate { get; set; }
        [DisplayName("سمت")]

        public string Role { get; set; }
        [DisplayName("مدرک تحصیلی")]

        public string DegreeOfEducation { get; set; }
        [DisplayName("شرح وظایف")]

        public string Duties { get; set; }
        [DisplayName("کد مجموعه")]

        public Nullable<int> AssistantId { get; set; }
        [DisplayName("عکس")]

        public string Avatar { get; set; }


    }
}