using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__munkalapok__View
    {
        Task<List<Admin__munkalapok__View>> GetClubs();
        Task<Admin__munkalapok__View> GetClub(Guid Id);
        Task AddClub(Admin__munkalapok__View admin__munkalapok__View);
        Task UpdateClub(Admin__munkalapok__View admin__munkalapok__View);
        Task DeleteClub(Guid Id);
    }
}
