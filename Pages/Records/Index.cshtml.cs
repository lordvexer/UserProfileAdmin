using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.Records
{
    public class IndexModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public IndexModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<AboutUs_Record> AboutUs_Record { get;set; }

        public async Task OnGetAsync()
        {
            var id = 0;
            if (String.IsNullOrEmpty(Request.Query["id"]))
            {
                AboutUs_Record = await _context.AboutUs_Records.Where(y => !y.AssistantId.HasValue).ToListAsync();
            }
            else if (int.TryParse(Request.Query["id"], out id))
            {
                AboutUs_Record = await _context.AboutUs_Records.Where(y => y.AssistantId == id).ToListAsync();
            }
            else
            {
                AboutUs_Record = new List<AboutUs_Record>();
                RedirectToPage("~/404");
            }
        }
    }
}
