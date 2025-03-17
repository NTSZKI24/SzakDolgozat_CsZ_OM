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

        public async Task<Admin_tulajok_View> GetAdmin_tulajok_View(Guid Id)
        {
            var admin_tulajok_View = await _context.admin_tulajok_Viewes.FindAsync(Id);
            if (admin_tulajok_View == null)
            {
                throw new Exception("Admin_tulajok_View not found");
            }
            return admin_tulajok_View;
        }

        public async Task AddAdmin_tulajok_View(Admin_tulajok_View admin_tulajok_View)
        {
            _context.admin_tulajok_Viewes.Add(admin_tulajok_View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin_tulajok_View(Admin_tulajok_View admin_tulajok_View)
        {
            _context.Entry(admin_tulajok_View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin_tulajok_View(Guid Id)
        {
            var admin_tulajok_View = await _context.admin_tulajok_Viewes.FindAsync(Id);
            if (admin_tulajok_View != null)
            {
                _context.admin_tulajok_Viewes.Remove(admin_tulajok_View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
