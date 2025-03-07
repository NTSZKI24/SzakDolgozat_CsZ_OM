using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__tulajok__View
    {
        Task<List<Admin__tulajok__View>> GetClubs();
        Task<Admin__tulajok__View> GetClub(Guid Id);
        Task AddClub(Admin__tulajok__View admin__tulajok__View);
        Task UpdateClub(Admin__tulajok__View admin__tulajok__View);
        Task DeleteClub(Guid Id);
    }
}
