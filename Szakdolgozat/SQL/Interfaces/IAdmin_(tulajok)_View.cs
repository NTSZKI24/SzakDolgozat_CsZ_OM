using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface IAdmin__tulajok__View
    {
        Task<List<Admin__tulajok__View>> GetAdmin__tulajok__Viewok();
        Task<Admin__tulajok__View> GetAdmin__tulajok__View(Guid Id);
        Task AddAdmin__tulajok__View(Admin__tulajok__View admin__tulajok__View);
        Task UpdateAdmin__tulajok__View(Admin__tulajok__View admin__tulajok__View);
        Task DeleteAdmin__tulajok__View(Guid Id);
    }
}
