using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_felhasznalok_View
    {
        Task<List<Admin_felhasznalok_View>> GetAdmin_felhasznalok_Viewok();

    }
}
