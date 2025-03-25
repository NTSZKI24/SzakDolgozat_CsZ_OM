using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAutoTulaj
    {
        Task<List<AutoTulaj>> GetAutoTulajok();
        Task<AutoTulaj> GetAutoTulaj(Guid Id);
        Task AddAutoTulaj(AutoTulaj autoTulaj);
        Task UpdateAutoTulaj(AutoTulaj autoTulaj);
        Task DeleteAutoTulaj(Guid Id);
    }
}
