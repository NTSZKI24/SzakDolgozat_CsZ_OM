using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin_felhasznalok_View_Service : IAdmin_felhasznalok_View
    {
        private readonly AppDbContext _context;

        public Admin_felhasznalok_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin_felhasznalok_View>> GetAdmin_felhasznalok_Viewok()
        {
            return await _context.admin_felhasznalok_Viewes.ToListAsync();
        }

    }
}
