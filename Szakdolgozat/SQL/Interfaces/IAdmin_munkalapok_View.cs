using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_munkalapok_View
    {
        Task<List<Admin_munkalapok_View>> GetAdmin_munkalapok_Viewok();
    }
}
