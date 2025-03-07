using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IRole
    {
        Task<List<Role>> GetClubs();
        Task<Role> GetClub(Guid Id);
        Task AddClub(Role role);
        Task UpdateClub(Role role);
        Task DeleteClub(Guid Id);
    }
}
