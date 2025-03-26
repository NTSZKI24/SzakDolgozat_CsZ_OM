using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Services
{
    public class Felhasznalo_Service : IFelhasznalo
    {
        private readonly AppDbContext _context;

        public Felhasznalo_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Felhasznalo>> GetFelhasznalok()
        {
            return await _context.felhasznalok.ToListAsync();
        }

        public async Task<Felhasznalo> GetFelhasznalo(Guid Id)
        {
            var felhasznalo = await _context.felhasznalok.FindAsync(Id);
            if (felhasznalo == null)
            {
                throw new Exception("Felhasznalo not found");
            }
            return felhasznalo;
        }

        public async Task AddFelhasznalo(Felhasznalo felhasznalo)
        {
            _context.felhasznalok.Add(felhasznalo);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateFelhasznalo(Felhasznalo felhasznalo)
        {
            _context.Entry(felhasznalo).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteFelhasznalo(Guid Id)
        {
            var felhasznalo = await _context.felhasznalok.FindAsync(Id);
            if (felhasznalo != null)
            {
                _context.felhasznalok.Remove(felhasznalo);
                await _context.SaveChangesAsync();
            }
        }

    }
}

