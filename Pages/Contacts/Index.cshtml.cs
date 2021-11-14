using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.Contacts
{
    public class IndexModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public IndexModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<AboutUs_Contacts> AboutUs_Contacts { get;set; }

        public async Task OnGetAsync()
        {
            var id = 0;
            if (String.IsNullOrEmpty(Request.Query["id"]))
            {
                AboutUs_Contacts = await _context.AboutUs_Contacts.Where(y => !y.AssistantId.HasValue).ToListAsync();
            }
            else if (int.TryParse(Request.Query["id"], out id))
            {
                AboutUs_Contacts = await _context.AboutUs_Contacts.Where(y => y.AssistantId == id).ToListAsync();
            }
            else
            {
                AboutUs_Contacts = new List<AboutUs_Contacts>();
                RedirectToPage("~/404");
            }
        }
    }
}
