using Radzen.Blazor;
using Radzen;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Services;
using Microsoft.AspNetCore.Components;

namespace SzakDolgozat.Components.Pages
{
    public partial class Hozzaad
    {
        [Inject]
        public SzakDolgozat.SQL.Interfaces.IAuto Auto_Service { get; set; }
        
        [Inject]
        public SzakDolgozat.SQL.Interfaces.IAutoTulaj AutoTulaj_Service { get; set; }

        [Inject]
        public AppDbContext _appDbContext { get; set; }

        [Inject]
        public NotificationService notificationService { get; set; }

        Auto auto = new Auto();
        AutoTulaj autoTulaj = new AutoTulaj();

        private async Task OnSubmit()
        {


            // Mentés az adatbázisba
            _appDbContext.autok.Add(auto);
            await _appDbContext.SaveChangesAsync();
            _appDbContext.autoTulajok.Add(autoTulaj);
            await _appDbContext.SaveChangesAsync();

            // Értesítés a sikeres mentésről
            notificationService.Notify(new NotificationMessage
            {
                Severity = NotificationSeverity.Success,
                Summary = "Siker",
                Detail = "Az adatok mentése sikeres!",
                Duration = 3000
            });

        }
    }
}
