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
    public class DetailsModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public DetailsModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        public Fiders1 Fiders1 { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Fiders1 = await _context.Fiders1.FirstOrDefaultAsync(m => m.Id == id);

            if (Fiders1 == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
