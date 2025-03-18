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

        public async Task<Admin_munkalapok_View> GetAdmin_munkalapok_View(Guid Id)
        {
            var admin_munkalapok_View = await _context.admin_munkalapok_Viewes.FindAsync(Id);
            if (admin_munkalapok_View == null)
            {
                throw new Exception("Admin_munkalapok_View not found");
            }
            return admin_munkalapok_View;
        }

        public async Task AddAdmin_munkalapok_View(Admin_munkalapok_View admin_munkalapok_View)
        {
            _context.admin_munkalapok_Viewes.Add(admin_munkalapok_View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin_munkalapok_View(Admin_munkalapok_View admin_munkalapok_View)
        {
            _context.Entry(admin_munkalapok_View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin_munkalapok_View(Guid Id)
        {
            var admin_munkalapok_View = await _context.admin_munkalapok_Viewes.FindAsync(Id);
            if (admin_munkalapok_View != null)
            {
                _context.admin_munkalapok_Viewes.Remove(admin_munkalapok_View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
