using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class AutoTulaj_Service : IAutoTulaj
    {
        private readonly AppDbContext _context;

        public AutoTulaj_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<AutoTulaj>> GetAutoTulajok()
        {
            return await _context.autoTulajok.ToListAsync();
        }

        public async Task<AutoTulaj> GetAutoTulaj(Guid Id)
        {
            var autoTulaj = await _context.autoTulajok.FindAsync(Id);
            if (autoTulaj == null)
            {
                throw new Exception("AutoTulaj not found");
            }
            return autoTulaj;
        }

        public async Task AddAutoTulaj(AutoTulaj autoTulaj)
        {
            _context.autoTulajok.Add(autoTulaj);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAutoTulaj(AutoTulaj autoTulaj)
        {
            _context.Entry(autoTulaj).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAutoTulaj(Guid Id)
        {
            var autoTulaj = await _context.autoTulajok.FindAsync(Id);
            if (autoTulaj != null)
            {
                _context.autoTulajok.Remove(autoTulaj);
                await _context.SaveChangesAsync();
            }
        }
    }
}
