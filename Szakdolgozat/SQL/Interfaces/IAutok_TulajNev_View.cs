using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAutok_TulajNev_View
    {
        Task<List<Autok_TulajNev_View>> GetClubs();
        Task<Autok_TulajNev_View> GetClub(Guid Id);
        Task AddClub(Autok_TulajNev_View autok_TulajNev_View);
        Task UpdateClub(Autok_TulajNev_View autok_TulajNev_View);
        Task DeleteClub(Guid Id);
    }
}
