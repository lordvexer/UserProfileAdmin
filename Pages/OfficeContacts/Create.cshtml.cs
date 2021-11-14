using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.OC
{
    public class CreateModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public CreateModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public AboutUs_OfficeContacts AboutUs_OfficeContacts { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.AboutUs_OfficeContacts.Add(AboutUs_OfficeContacts);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
