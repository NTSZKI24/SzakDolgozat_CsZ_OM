using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__munkalapok__View
    {
        Task<List<Admin__munkalapok__View>> GetAdmin__munkalapok__Viewok();
        Task<Admin__munkalapok__View> GetAdmin__munkalapok__View(Guid Id);
        Task AddAdmin__munkalapok__View(Admin__munkalapok__View admin__munkalapok__View);
        Task UpdateAdmin__munkalapok__View(Admin__munkalapok__View admin__munkalapok__View);
        Task DeleteAdmin__munkalapok__View(Guid Id);
    }
}
