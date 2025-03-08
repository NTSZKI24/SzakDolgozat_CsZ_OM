using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAutok_TulajNev_View
    {
        Task<List<Autok_TulajNev_View>> GetAutok_TulajNev_Viewok();
        Task<Autok_TulajNev_View> GetAutok_TulajNev_View(Guid Id);
        Task AddAutok_TulajNev_View(Autok_TulajNev_View autok_TulajNev_View);
        Task UpdateAutok_TulajNev_View(Autok_TulajNev_View autok_TulajNev_View);
        Task DeleteAutok_TulajNev_View(Guid Id);
    }
}
