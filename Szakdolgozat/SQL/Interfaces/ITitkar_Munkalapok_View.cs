using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface ITitkar_Munkalapok_View
    {
        Task<List<Titkar_Munkalapok_View>> GetTitkar_Munkalapok_Viewok();
    }
}
