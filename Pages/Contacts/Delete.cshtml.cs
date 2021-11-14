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
    public class DeleteModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public DeleteModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public AboutUs_Contacts AboutUs_Contacts { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_Contacts = await _context.AboutUs_Contacts.FirstOrDefaultAsync(m => m.Id == id);

            if (AboutUs_Contacts == null)
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

            AboutUs_Contacts = await _context.AboutUs_Contacts.FindAsync(id);

            if (AboutUs_Contacts != null)
            {
                _context.AboutUs_Contacts.Remove(AboutUs_Contacts);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
