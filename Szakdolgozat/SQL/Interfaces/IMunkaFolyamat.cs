using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkaFolyamat
    {
        Task<List<MunkaFolyamat>> GetClubs();
        Task<MunkaFolyamat> GetClub(Guid Id);
        Task AddClub(MunkaFolyamat munkaFolyamat);
        Task UpdateClub(MunkaFolyamat munkaFolyamat);
        Task DeleteClub(Guid Id);
    }
}
