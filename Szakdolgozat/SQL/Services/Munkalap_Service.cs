using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Munkalap_Service : IMunkalap
    {
        private readonly AppDbContext _context;

        public Munkalap_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Munkalap>> GetMunkalapok()
        {
            return await _context.munkaLapok.ToListAsync();
        }

        public async Task<Munkalap> GetMunkalap(Guid Id)
        {
            var munkalap = await _context.munkaLapok.FindAsync(Id);
            if (munkalap == null)
            {
                throw new Exception("Munkalap not found");
            }
            return munkalap;
        }

        public async Task AddMunkalap(Munkalap munkalap)
        {
            _context.munkaLapok.Add(munkalap);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateMunkalap(Munkalap munkalap)
        {
            _context.Entry(munkalap).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteMunkalap(Guid Id)
        {
            var munkalap = await _context.munkaLapok.FindAsync(Id);
            if (munkalap != null)
            {
                _context.munkaLapok.Remove(munkalap);
                await _context.SaveChangesAsync();
            }
        }
    }
}
