using SzakDolgozat.SQL.Classes;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__felhasznalok__View
    {
        Task<List<Admin__felhasznalok__View>> GetAdmin__felhasznalok__Viewok();
        Task<Admin__felhasznalok__View> GetAdmin__felhasznalok__View(Guid Id);
        Task AddAdmin__felhasznalok__View(Admin__felhasznalok__View admin__felhasznalok__View);
        Task UpdateAdmin__felhasznalok__View(Admin__felhasznalok__View admin__felhasznalok__View);
        Task DeleteAdmin__felhasznalok__View(Guid Id);
    }
}
