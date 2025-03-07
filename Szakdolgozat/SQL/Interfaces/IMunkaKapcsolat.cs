using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkaKapcsolat
    {
        Task<List<MunkaKapcsolat>> GetClubs();
        Task<MunkaKapcsolat> GetClub(Guid Id);
        Task AddClub(MunkaKapcsolat munkaKapcsolat);
        Task UpdateClub(MunkaKapcsolat munkaKapcsolat);
        Task DeleteClub(Guid Id);
    }
}
