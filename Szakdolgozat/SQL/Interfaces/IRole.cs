using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IRole
    {
        Task<List<Role>> GetRolek();
        Task<Role> GetRole(Guid Id);
        Task AddRole(Role role);
        Task UpdateRole(Role role);
        Task DeleteRole(Guid Id);
    }
}
