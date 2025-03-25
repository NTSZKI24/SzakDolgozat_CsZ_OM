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
                .Where(u => u.RoleNev == Enum.RoleEnum.szerelo)
                .Select(u => new Titkar_SzereloDropDown_View
                {
                    SzereloNev = u.SzereloNev,
                    Statusz = u.Statusz,

                })
                .ToListAsync();

            return szerelokStatusz;
        }

        public StatuszEnum DetermineSzereloStatus(List<StatuszEnum> munkalapStatusok)
        {
            if (munkalapStatusok.Any(s => s == StatuszEnum.Szereles))
                return StatuszEnum.Szereles;
            if (munkalapStatusok.All(s => s == StatuszEnum.AlkatreszreVar))
                return StatuszEnum.AlkatreszreVar;
            return StatuszEnum.NincsMunka;
        }
    }
}
