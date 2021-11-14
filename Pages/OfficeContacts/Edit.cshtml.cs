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

namespace TvedcAdmin.Pages.OC
{
    public class EditModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public EditModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public AboutUs_OfficeContacts AboutUs_OfficeContacts { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_OfficeContacts = await _context.AboutUs_OfficeContacts.FirstOrDefaultAsync(m => m.Id == id);

            if (AboutUs_OfficeContacts == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(AboutUs_OfficeContacts).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AboutUs_OfficeContactsExists(AboutUs_OfficeContacts.Id))
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

        private bool AboutUs_OfficeContactsExists(int id)
        {
            return _context.AboutUs_OfficeContacts.Any(e => e.Id == id);
        }
    }
}
