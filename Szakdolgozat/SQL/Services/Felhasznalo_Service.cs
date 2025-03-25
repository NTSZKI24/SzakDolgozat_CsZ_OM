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

        public async Task<List<UserWithStatusDto>> GetSzerelokWithStatusAsync()
        {
            var szerelok = await _context.rolok
                .Where(u => u.RoleNev == "Szerelő")
                .Select(u => new UserWithStatusDto
                {
                    Nev = u.Name,
                    Statusz = u.WorkRelations
                        .Select(wr => wr.WorkOrder.Status) // Munkalap státuszok lekérése
                    .DefaultIfEmpty(StatuszEnum.NincsMunka) // Ha nincs munkája, akkor "NincsMunka"
                        .Max() // A legfontosabb státuszt választjuk ki
                })
                .ToListAsync();

            return szerelok;
        }
    }
}
public class UserWithStatusDto
{
    public string Nev { get; set; }
    public StatuszEnum Statusz { get; set; }
}
