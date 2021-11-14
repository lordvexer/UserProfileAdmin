using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.OfficeExpert
{
    public class DetailsModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public DetailsModel(TvedcAdmin.Data.ApplicationDbContext context)
        {
            _context = context;
        }

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
    }
}
