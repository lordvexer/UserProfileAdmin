﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TvedcAdmin.Data;
using TvedcAdmin.Models;

namespace TvedcAdmin.Pages.OC
{
    public class DeleteModel : PageModel
    {
        private readonly TvedcAdmin.Data.ApplicationDbContext _context;

        public DeleteModel(TvedcAdmin.Data.ApplicationDbContext context)
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

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            AboutUs_OfficeContacts = await _context.AboutUs_OfficeContacts.FindAsync(id);

            if (AboutUs_OfficeContacts != null)
            {
                _context.AboutUs_OfficeContacts.Remove(AboutUs_OfficeContacts);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
