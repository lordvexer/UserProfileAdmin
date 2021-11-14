using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.Fiders
{
    public class IndexModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public IndexModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<Fiders1> Fiders1 { get;set; }

        public async Task OnGetAsync()
        {
            Fiders1 = await _context.Fiders1.ToListAsync();
        }
    }
}
