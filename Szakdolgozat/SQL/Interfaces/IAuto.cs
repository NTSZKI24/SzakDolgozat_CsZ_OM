using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAuto
    {
        Task<List<Auto>> GetAutok();
        Task<Auto> GetAuto(Guid Id);
        Task AddAuto(Auto auto);
        Task UpdateAuto(Auto auto);
        Task DeleteAuto(Guid Id);

    }
}
