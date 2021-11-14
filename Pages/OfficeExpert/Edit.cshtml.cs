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

namespace TvedcAdmin.Pages.OfficeExpert
{
    public class EditModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public EditModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public AboutUs_OfficeExpert AboutUs_OfficeExpert { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_OfficeExpert = await _context.AboutUs_OfficeExpert.FirstOrDefaultAsync(m => m.Id == id);

            if (AboutUs_OfficeExpert == null)
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

            _context.Attach(AboutUs_OfficeExpert).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AboutUs_OfficeExpertExists(AboutUs_OfficeExpert.Id))
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

        private bool AboutUs_OfficeExpertExists(int id)
        {
            return _context.AboutUs_OfficeExpert.Any(e => e.Id == id);
        }
    }
}
