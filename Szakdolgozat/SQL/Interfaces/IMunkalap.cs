using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkalap
    {
        Task<List<Munkalap>> GetClubs();
        Task<Munkalap> GetClub(Guid Id);
        Task AddClub(Munkalap munkalap);
        Task UpdateClub(Munkalap munkalap);
        Task DeleteClub(Guid Id);
    }
}
