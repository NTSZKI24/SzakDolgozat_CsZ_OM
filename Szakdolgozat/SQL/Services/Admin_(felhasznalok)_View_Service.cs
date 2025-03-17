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

        public async Task<Admin_felhasznalok_View> GetAdmin_felhasznalok_View(Guid Id)
        {
            var admin_felhasznalok_View = await _context.admin_felhasznalok_Viewes.FindAsync(Id);
            if (admin_felhasznalok_View == null)
            {
                throw new Exception("Admin_felhasznalok_View not found");
            }
            return admin_felhasznalok_View;
        }

        public async Task AddAdmin_felhasznalok_View(Admin_felhasznalok_View admin_felhasznalok_View)
        {
            _context.admin_felhasznalok_Viewes.Add(admin_felhasznalok_View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin_felhasznalok_View(Admin_felhasznalok_View admin_felhasznalok_View)
        {
            _context.Entry(admin_felhasznalok_View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin_felhasznalok_View(Guid Id)
        {
            var admin_felhasznalok_View = await _context.admin_felhasznalok_Viewes.FindAsync(Id);
            if (admin_felhasznalok_View != null)
            {
                _context.admin_felhasznalok_Viewes.Remove(admin_felhasznalok_View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
