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
        void ShowNotification(NotificationMessage message)
        {
            NotificationService.Notify(message);
        }
        private async Task OnSubmit()
        {
            if (string.IsNullOrWhiteSpace(autoTulaj.Nev))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A név megadása kötelező!",
                    Duration = 3000,
                    
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(autoTulaj.Email))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "Az email cím megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (!autoTulaj.Email.Contains("@") || !autoTulaj.Email.Contains("."))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "Érvénytelen email cím formátum!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(autoTulaj.Telefonszam))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A Telefonszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Marka))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A Márka megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Rendszam))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A Rendszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.AlvazSzam))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "Az Alvázszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (auto.AlvazSzam.Length != 17)
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "Az Alvázszám formátuma érvénytelen!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Tipus))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A Tipus megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Uzemanyag))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "Az Üzemanyag megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Motor))
            {
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Detail = "A Motor megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else
            {
                // Mentés az adatbázisba
                
                _appDbContext.autok.Add(auto);
                await _appDbContext.SaveChangesAsync();
                _appDbContext.autoTulajok.Add(autoTulaj);
                await _appDbContext.SaveChangesAsync();
                

                // Értesítés a sikeres mentésről
                ShowNotification(new NotificationMessage
                {
                    Severity = NotificationSeverity.Success,
                    Summary = "Siker",
                    Detail = "Sikeres adatfelvitel!",
                    Duration = 3000
                });
            }
        }
    }
}
