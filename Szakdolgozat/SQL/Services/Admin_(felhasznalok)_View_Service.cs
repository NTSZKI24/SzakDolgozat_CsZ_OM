using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
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

        public async Task<List<Admin__felhasznalok__View>> GetClubs()
        {
            return await _context.Admin__felhasznalok__Viewes.ToListAsync();
        }

        public async Task<Admin__felhasznalok__View> GetClub(Guid Id)
        {
            var club = await _context.Admin__felhasznalok__Viewes.FindAsync(Id);
            if (club == null)
            {
                throw new Exception("Admin__felhasznalok__View_Service not found");
            }
            return club;
        }

        public async Task AddClub(Admin__felhasznalok__View admin__felhasznalok__View_Service)
        {
            _context.Admin__felhasznalok__Viewes.Add(admin__felhasznalok__View_Service);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateClub(Admin__felhasznalok__View admin__felhasznalok__View_Service)
        {
            _context.Entry(admin__felhasznalok__View_Service).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteClub(Guid Id)
        {
            var club = await _context.Admin__felhasznalok__Viewes.FindAsync(Id);
            if (club != null)
            {
                _context.Admin__felhasznalok__Viewes.Remove(club);
                await _context.SaveChangesAsync();
            }
        }
    }
}
