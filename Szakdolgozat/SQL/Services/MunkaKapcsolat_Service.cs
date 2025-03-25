using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class MunkaKapcsolat_Service : IMunkaKapcsolat
    {
        private readonly AppDbContext _context;

        public MunkaKapcsolat_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<MunkaKapcsolat>> GetMunkaKapcsolatok()
        {
            return await _context.munkaKapcsolatok.ToListAsync();
        }

        public async Task<MunkaKapcsolat> GetMunkaKapcsolat(Guid Id)
        {
            var munkaKapcsolat = await _context.munkaKapcsolatok.FindAsync(Id);
            if (munkaKapcsolat == null)
            {
                throw new Exception("MunkaKapcsolat not found");
            }
            return munkaKapcsolat;
        }

        public async Task AddMunkaKapcsolat(MunkaKapcsolat munkaKapcsolat)
        {
            _context.munkaKapcsolatok.Add(munkaKapcsolat);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateMunkaKapcsolat(MunkaKapcsolat munkaKapcsolat)
        {
            _context.Entry(munkaKapcsolat).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteMunkaKapcsolat(Guid Id)
        {
            var munkaKapcsolat = await _context.munkaKapcsolatok.FindAsync(Id);
            if (munkaKapcsolat != null)
            {
                _context.munkaKapcsolatok.Remove(munkaKapcsolat);
                await _context.SaveChangesAsync();
            }
        }
    }
}
