using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_tulajok_View
    {
        Task<List<Admin_tulajok_View>> GetAdmin_tulajok_Viewok();
    }
}
