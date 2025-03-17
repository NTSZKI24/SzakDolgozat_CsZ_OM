using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_tulajok_View
    {
        Task<List<Admin_tulajok_View>> GetAdmin_tulajok_Viewok();
        Task<Admin_tulajok_View> GetAdmin_tulajok_View(Guid Id);
        Task AddAdmin_tulajok_View(Admin_tulajok_View admin_tulajok_View);
        Task UpdateAdmin_tulajok_View(Admin_tulajok_View admin_tulajok_View);
        Task DeleteAdmin_tulajok_View(Guid Id);
    }
}
