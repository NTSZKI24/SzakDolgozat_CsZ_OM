using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin__tulajok__View_Service : IAdmin__tulajok__View
    {
        private readonly AppDbContext _context;

        public Admin__tulajok__View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin__tulajok__View>> GetAdmin__tulajok__Viewok()
        {
            return await _context.admin__tulajok__Viewes.ToListAsync();
        }

        public async Task<Admin__tulajok__View> GetAdmin__tulajok__View(Guid Id)
        {
            var admin__tulajok__View = await _context.admin__tulajok__Viewes.FindAsync(Id);
            if (admin__tulajok__View == null)
            {
                throw new Exception("Admin__tulajok__View not found");
            }
            return admin__tulajok__View;
        }

        public async Task AddAdmin__tulajok__View(Admin__tulajok__View admin__tulajok__View)
        {
            _context.admin__tulajok__Viewes.Add(admin__tulajok__View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin__tulajok__View(Admin__tulajok__View admin__tulajok__View)
        {
            _context.Entry(admin__tulajok__View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin__tulajok__View(Guid Id)
        {
            var admin__tulajok__View = await _context.admin__tulajok__Viewes.FindAsync(Id);
            if (admin__tulajok__View != null)
            {
                _context.admin__tulajok__Viewes.Remove(admin__tulajok__View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
