using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__felhasznalok__View
    {
        Task<List<Admin__felhasznalok__View>> GetClubs();
        Task<Admin__felhasznalok__View> GetClub(Guid Id);
        Task AddClub(Admin__felhasznalok__View admin__felhasznalok__View);
        Task UpdateClub(Admin__felhasznalok__View admin__felhasznalok__View);
        Task DeleteClub(Guid Id);
    }
}
