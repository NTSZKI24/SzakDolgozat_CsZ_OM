using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAuto
    {
        Task<List<Auto>> GetClubs();
        Task<Auto> GetClub(Guid Id);
        Task AddClub(Auto auto);
        Task UpdateClub(Auto auto);
        Task DeleteClub(Guid Id);
    }
}
