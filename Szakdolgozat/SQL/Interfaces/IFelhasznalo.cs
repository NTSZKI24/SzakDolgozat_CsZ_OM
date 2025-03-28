using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IFelhasznalo
    {
        Task<List<Felhasznalo>> GetFelhasznalok();
        Task<Felhasznalo> GetFelhasznalo(Guid Id);
        Task AddFelhasznalo(Felhasznalo felhasznalo);
        Task UpdateFelhasznalo(Felhasznalo felhasznalo);
        Task DeleteFelhasznalo(Guid Id);
    }
}
