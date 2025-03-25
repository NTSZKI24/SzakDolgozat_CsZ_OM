using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Interfaces;
using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Services
{
    public class Titkar_Munkalapok_View_Service : ITitkar_Munkalapok_View
    {
        private readonly AppDbContext _context;

        public Titkar_Munkalapok_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Titkar_Munkalapok_View>> GetTitkar_Munkalapok_Viewok()
        {
            return await _context.titkar_Munkalapok_Viewes.ToListAsync();
        }


    }
}
