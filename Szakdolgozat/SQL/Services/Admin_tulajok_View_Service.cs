using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin_tulajok_View_Service : IAdmin_tulajok_View
    {
        private readonly AppDbContext _context;

        public Admin_tulajok_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin_tulajok_View>> GetAdmin_tulajok_Viewok()
        {
            return await _context.admin_tulajok_Viewes.ToListAsync();
        }

        
    }
}
