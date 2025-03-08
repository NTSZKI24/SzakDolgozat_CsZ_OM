using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IMunkalap
    {
        Task<List<Munkalap>> GetMunkalapok();
        Task<Munkalap> GetMunkalap(Guid Id);
        Task AddMunkalap(Munkalap munkalap);
        Task UpdateMunkalap(Munkalap munkalap);
        Task DeleteMunkalap(Guid Id);
    }
}
