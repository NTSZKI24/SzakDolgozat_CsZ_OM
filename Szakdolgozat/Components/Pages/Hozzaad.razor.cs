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
            if (string.IsNullOrWhiteSpace(autoTulaj.Nev))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A név megadása kötelező!",
                    Duration = 3000,
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(autoTulaj.Email))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "Az email cím megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (!autoTulaj.Email.Contains("@") || !autoTulaj.Email.Contains("."))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "Érvénytelen email cím formátum!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(autoTulaj.Telefonszam))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A Telefonszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (autoTulaj.Telefonszam.Length != 14 || !autoTulaj.Telefonszam[0].Equals("+"))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A Telefonszám formátuma érvénytelen!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Marka))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A Márka megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Rendszam))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A Rendszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.AlvazSzam))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "Az Alvázszám megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (auto.AlvazSzam.Length != 17)
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "Az Alvázszám formátuma érvénytelen!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Tipus))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style = Colors.Danger,
                    Detail = "A Tipus megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Uzemanyag))
            {
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Error,
                    Summary = "Hiba",
                    Style =Colors.Danger,
                    Detail = "Az Üzemanyag megadása kötelező!",
                    Duration = 3000
                });
                return;
            }
            else if (string.IsNullOrWhiteSpace(auto.Motor))
            {
                notificationService.Notify(new NotificationMessage
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
                notificationService.Notify(new NotificationMessage
                {
                    Severity = NotificationSeverity.Success,
                    Summary = "Siker",
                    Style = Colors.Black,
                    Detail = "Sikeres adatfelvitel!",
                    Duration = 3000
                });
            }
        }
    }
}
