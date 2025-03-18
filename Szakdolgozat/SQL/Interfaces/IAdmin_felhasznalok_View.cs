using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_felhasznalok_View
    {
        Task<List<Admin_felhasznalok_View>> GetAdmin_felhasznalok_Viewok();
        Task<Admin_felhasznalok_View> GetAdmin_felhasznalok_View(Guid Id);
        Task AddAdmin_felhasznalok_View(Admin_felhasznalok_View admin_felhasznalok_View);
        Task UpdateAdmin_felhasznalok_View(Admin_felhasznalok_View admin_felhasznalok_View);
        Task DeleteAdmin_felhasznalok_View(Guid Id);
    }
}
