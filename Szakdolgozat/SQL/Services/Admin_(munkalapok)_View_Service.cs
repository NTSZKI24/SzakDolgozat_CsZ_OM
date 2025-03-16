using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Admin__munkalapok__View_Service : IAdmin__munkalapok__View
    {
        private readonly AppDbContext _context;

        public Admin__munkalapok__View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Admin__munkalapok__View>> GetAdmin__munkalapok__Viewok()
        {
            return await _context.admin__munkalapok__Viewes.ToListAsync();
        }

        public async Task<Admin__munkalapok__View> GetAdmin__munkalapok__View(Guid Id)
        {
            var admin__munkalapok__View = await _context.admin__munkalapok__Viewes.FindAsync(Id);
            if (admin__munkalapok__View == null)
            {
                throw new Exception("Admin__munkalapok__View not found");
            }
            return admin__munkalapok__View;
        }

        public async Task AddAdmin__munkalapok__View(Admin__munkalapok__View admin__munkalapok__View)
        {
            _context.admin__munkalapok__Viewes.Add(admin__munkalapok__View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAdmin__munkalapok__View(Admin__munkalapok__View admin__munkalapok__View)
        {
            _context.Entry(admin__munkalapok__View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAdmin__munkalapok__View(Guid Id)
        {
            var admin__munkalapok__View = await _context.admin__munkalapok__Viewes.FindAsync(Id);
            if (admin__munkalapok__View != null)
            {
                _context.admin__munkalapok__Viewes.Remove(admin__munkalapok__View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
