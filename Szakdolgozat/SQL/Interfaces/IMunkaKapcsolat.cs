using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkaKapcsolat
    {
        Task<List<MunkaKapcsolat>> GetMunkaKapcsolatok();
        Task<MunkaKapcsolat> GetMunkaKapcsolat(Guid Id);
        Task AddMunkaKapcsolat(MunkaKapcsolat munkaKapcsolat);
        Task UpdateMunkaKapcsolat(MunkaKapcsolat munkaKapcsolat);
        Task DeleteMunkaKapcsolat(Guid Id);
    }
}
