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

        public async Task<List<Felhasznalo>> GetTitkar_SzereloDropDown_Viewok()
        {

            if (!_context.rolok.Any())
            {
                return new List<Felhasznalo>();
            }
                var roleId = _context.rolok.Single(a => a.RoleNev == "Szerelo").ID;
                var szerelokStatusz = _context.felhasznalok
                .Where(u => u.RoleID == roleId)
                .ToList();

                return szerelokStatusz;

        }

    }
}
