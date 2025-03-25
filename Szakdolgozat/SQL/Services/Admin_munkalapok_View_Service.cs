using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin_munkalapok_View_Service : IAdmin_munkalapok_View
    {
        private readonly AppDbContext _context;

        public Admin_munkalapok_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin_munkalapok_View>> GetAdmin_munkalapok_Viewok()
        {
            return await _context.admin_munkalapok_Viewes.ToListAsync();
        }

       
    }
}
