using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.Records
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
        public AboutUs_Record AboutUs_Record { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.AboutUs_Records.Add(AboutUs_Record);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
