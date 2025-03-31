using SzakDolgozat.SQL.Models;

namespace SzakDolgozat.SQL.Interfaces
{
    public interface ITitkar_SzereloDropDown_View
    {
        Task<List<Felhasznalo>> GetTitkar_SzereloDropDown_Viewok();
    }
}
