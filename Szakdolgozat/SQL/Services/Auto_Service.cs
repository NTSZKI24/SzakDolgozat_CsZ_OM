using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Auto_Service : IAuto
    {
        private readonly AppDbContext _context;

        public Auto_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Auto>> GetAutok()
        {
            return await _context.autok.ToListAsync();
        }

        public async Task<Auto> GetAuto(Guid Id)
        {
            var auto = await _context.autok.FindAsync(Id);
            if (auto == null)
            {
                throw new Exception("Auto not found");
            }
            return auto;
        }

        public async Task AddAuto(Auto auto)
        {
            _context.autok.Add(auto);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAuto(Auto auto)
        {
            _context.Entry(auto).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAuto(Guid Id)
        {
            var auto = await _context.autok.FindAsync(Id);
            if (auto != null)
            {
                _context.autok.Remove(auto);
                await _context.SaveChangesAsync();
            }
        }
    }
}
