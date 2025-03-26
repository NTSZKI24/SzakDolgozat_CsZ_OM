using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Enum;
using SzakDolgozat.SQL.Interfaces;
using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Services
{
    public class Titkar_SzereloDropDown_View_Service : ITitkar_SzereloDropDown_View
    {
        private readonly AppDbContext _context;

        public Titkar_SzereloDropDown_View_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Titkar_SzereloDropDown_View>> GetTitkar_SzereloDropDown_Viewok()
        {
            var szerelokStatusz = await _context.titkar_SzereloDropDown_Viewes
            .Where(u => u.RoleNev == "szerelo" &&
                       (u.Statusz == StatuszEnum.NincsMunka ||
                        u.Statusz == StatuszEnum.MunkaElfogadasraVar ||
                        u.Statusz == StatuszEnum.AlkatreszreVar ||
                        u.Statusz == StatuszEnum.Szereles))
            .GroupBy(u => u.SzereloNev) // Csoportosítjuk a szerelőket, hogy minden szerelő csak egyszer szerepeljen
            .Select(g => new Titkar_SzereloDropDown_View
            {
                SzereloNev = g.Key,
                Statusz = DetermineSzereloStatus(g.Select(u => u.Statusz).ToList()) // Az összes státusz listáját átadjuk
            })
            .OrderBy(u => (int)u.Statusz) // Prioritási sorrend: 1-NincsMunka, 2-AlkatreszreVar, 3-Szereles
            .ToListAsync();

            return szerelokStatusz;
        }

        public StatuszEnum DetermineSzereloStatus(List<StatuszEnum> munkalapStatusok)
        {
            if (munkalapStatusok.Any(s => s == StatuszEnum.Szereles))
                return StatuszEnum.Szereles;
            if (munkalapStatusok.Any(s => s == StatuszEnum.AlkatreszreVar))
                return StatuszEnum.AlkatreszreVar;
            if (munkalapStatusok.Any(s => s == StatuszEnum.MunkaElfogadasraVar))
                return StatuszEnum.MunkaElfogadasraVar;
            return StatuszEnum.NincsMunka;
        }
    }
}
