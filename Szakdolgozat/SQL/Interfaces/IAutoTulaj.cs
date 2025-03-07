using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAutoTulaj
    {
        Task<List<AutoTulaj>> GetClubs();
        Task<AutoTulaj> GetClub(Guid Id);
        Task AddClub(AutoTulaj autoTulaj);
        Task UpdateClub(AutoTulaj autoTulaj);
        Task DeleteClub(Guid Id);
    }
}
