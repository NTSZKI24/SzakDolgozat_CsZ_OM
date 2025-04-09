using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Interfaces;
using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Services
{
    public class Szerelo_Munka_View_Service : ISzerelo_Munka_View
    {
        private readonly AppDbContext _context;

        public Szerelo_Munka_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Szerelo_Munka_View>> GetSzerelo_Munka_Viewok()
        {
            return await _context.szerelo_Munka_Viewes.ToListAsync();
        }

        public async Task UpdateSzerelo_Munka_View(Szerelo_Munka_View updatedItem)
        {
            var existing = await _context.szerelo_Munka_Viewes.FirstOrDefaultAsync(x => x.ID == updatedItem.ID);
            if (existing == null)
                return;

            existing.Statusz = updatedItem.Statusz;

            if (existing.MunkaKezdete == null)
                existing.MunkaKezdete = updatedItem.MunkaKezdete;

            if (existing.MunkaIdo == null)
                existing.MunkaIdo = updatedItem.MunkaIdo;

            if (existing.Keltezes == null)
                existing.Keltezes = updatedItem.Keltezes;


            await _context.SaveChangesAsync();
        }
    }
}
