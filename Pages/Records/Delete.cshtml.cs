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
    public class DeleteModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public DeleteModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public AboutUs_Record AboutUs_Record { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_Record = await _context.AboutUs_Records.FirstOrDefaultAsync(m => m.Id == id);

            if (AboutUs_Record == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_Record = await _context.AboutUs_Records.FindAsync(id);

            if (AboutUs_Record != null)
            {
                _context.AboutUs_Records.Remove(AboutUs_Record);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
