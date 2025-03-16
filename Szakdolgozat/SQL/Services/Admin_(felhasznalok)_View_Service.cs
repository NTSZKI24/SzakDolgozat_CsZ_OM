using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin__felhasznalok__View_Service : IAdmin__felhasznalok__View
    {
        private readonly AppDbContext _context;

        public Admin__felhasznalok__View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin__felhasznalok__View>> GetAdmin__felhasznalok__Viewok()
        {
            return await _context.admin__felhasznalok__Viewes.ToListAsync();
        }

        public async Task<Admin__felhasznalok__View> GetAdmin__felhasznalok__View(Guid Id)
        {
            var admin__felhasznalok__View = await _context.admin__felhasznalok__Viewes.FindAsync(Id);
            if (admin__felhasznalok__View == null)
            {
                throw new Exception("Admin__felhasznalok__View not found");
            }
            return admin__felhasznalok__View;
        }

        public async Task AddAdmin__felhasznalok__View(Admin__felhasznalok__View admin__felhasznalok__View)
        {
            _context.admin__felhasznalok__Viewes.Add(admin__felhasznalok__View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin__felhasznalok__View(Admin__felhasznalok__View admin__felhasznalok__View)
        {
            _context.Entry(admin__felhasznalok__View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin__felhasznalok__View(Guid Id)
        {
            var admin__felhasznalok__View = await _context.admin__felhasznalok__Viewes.FindAsync(Id);
            if (admin__felhasznalok__View != null)
            {
                _context.admin__felhasznalok__Viewes.Remove(admin__felhasznalok__View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
