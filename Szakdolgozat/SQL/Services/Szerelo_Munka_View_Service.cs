using Microsoft.EntityFrameworkCore;
using System.Data;
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
    }
}
