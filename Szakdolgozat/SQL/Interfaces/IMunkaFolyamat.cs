using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkaFolyamat
    {
        Task<List<MunkaFolyamat>> GetMunkaFolyamatok();
        Task<MunkaFolyamat> GetMunkaFolyamat(Guid Id);
        Task AddMunkaFolyamat(MunkaFolyamat munkaFolyamat);
        Task UpdateMunkaFolyamat(MunkaFolyamat munkaFolyamat);
        Task DeleteMunkaFolyamat(Guid Id);
    }
}
