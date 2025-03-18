using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin_munkalapok_View
    {
        Task<List<Admin_munkalapok_View>> GetAdmin_munkalapok_Viewok();
        Task<Admin_munkalapok_View> GetAdmin_munkalapok_View(Guid Id);
        Task AddAdmin_munkalapok_View(Admin_munkalapok_View admin_munkalapok_View);
        Task UpdateAdmin_munkalapok_View(Admin_munkalapok_View admin_munkalapok_View);
        Task DeleteAdmin_munkalapok_View(Guid Id);
    }
}
