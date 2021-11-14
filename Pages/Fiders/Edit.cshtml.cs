using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.Fiders
{
    public class EditModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public EditModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
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

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Fiders1).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Fiders1Exists(Fiders1.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool Fiders1Exists(int id)
        {
            return _context.Fiders1.Any(e => e.Id == id);
        }
    }
}
