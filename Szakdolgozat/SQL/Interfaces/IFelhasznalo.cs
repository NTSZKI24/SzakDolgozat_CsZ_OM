using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IFelhasznalo
    {
        Task<List<Felhasznalo>> GetClubs();
        Task<Felhasznalo> GetClub(Guid Id);
        Task AddClub(Felhasznalo felhasznalo);
        Task UpdateClub(Felhasznalo felhasznalo);
        Task DeleteClub(Guid Id);
    }
}
