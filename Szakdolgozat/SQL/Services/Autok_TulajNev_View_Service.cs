using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Autok_TulajNev_View_Service : IAutok_TulajNev_View
    {
        private readonly AppDbContext _context;

        public Autok_TulajNev_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Autok_TulajNev_View>> GetAutok_TulajNev_Viewok()
        {
            return await _context.autok_TulajNev_Viewes.ToListAsync();
        }

        public async Task<Autok_TulajNev_View> GetAutok_TulajNev_View(Guid Id)
        {
            var autok_TulajNev_View = await _context.autok_TulajNev_Viewes.FindAsync(Id);
            if (autok_TulajNev_View == null)
            {
                throw new Exception("Autok_TulajNev_View not found");
            }
            return autok_TulajNev_View;
        }

        public async Task AddAutok_TulajNev_View(Autok_TulajNev_View autok_TulajNev_View)
        {
            _context.autok_TulajNev_Viewes.Add(autok_TulajNev_View);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAutok_TulajNev_View(Autok_TulajNev_View autok_TulajNev_View)
        {
            _context.Entry(autok_TulajNev_View).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAutok_TulajNev_View(Guid Id)
        {
            var autok_TulajNev_View = await _context.autok_TulajNev_Viewes.FindAsync(Id);
            if (autok_TulajNev_View != null)
            {
                _context.autok_TulajNev_Viewes.Remove(autok_TulajNev_View);
                await _context.SaveChangesAsync();
            }
        }
    }
}
