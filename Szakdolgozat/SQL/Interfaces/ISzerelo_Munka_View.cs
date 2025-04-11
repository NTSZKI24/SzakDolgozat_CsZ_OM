using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface ISzerelo_Munka_View
    {
        Task<List<Szerelo_Munka_View>> GetSzerelo_Munka_Viewok();

    }
}
