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

        private string notificationMessage = string.Empty;
        private string messageColor = "color:black;";

        private async Task OnSubmit()
        {
            notificationMessage = "";
            messageColor = "color:black;";
            if (string.IsNullOrWhiteSpace(autoTulaj.Nev))
            {
                notificationMessage = "A név megadása kötelező!";
                return;
            }
            if (string.IsNullOrWhiteSpace(autoTulaj.Email))
            {
                notificationMessage = "Az email cím megadása kötelező!";
                return;
            }
            if (!autoTulaj.Email.Contains("@") || !autoTulaj.Email.Contains("."))
            {
                notificationMessage = "Érvénytelen email cím formátum!";
                return;
            }
            if (string.IsNullOrWhiteSpace(autoTulaj.Telefonszam))
            {
                notificationMessage = "A Telefonszám megadása kötelező!";
                return;
            }
            if (autoTulaj.Telefonszam.Length != 14 || !autoTulaj.Telefonszam[0].Equals("+"))
            {
                notificationMessage = "A Telefonszám formátuma érvénytelen!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.Marka))
            {
                notificationMessage = "A Márka megadása kötelező!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.Rendszam))
            {
                notificationMessage = "A Rendszám megadása kötelező!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.AlvazSzam))
            {
                notificationMessage = "Az Alvázszám megadása kötelező!";
                return;
            }
            if (auto.AlvazSzam.Length != 17)
            {
                notificationMessage = "Az Alvázszám formátuma érvénytelen!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.Tipus))
            {
                notificationMessage = "A Tipus megadása kötelező!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.Uzemanyag))
            {
                notificationMessage = "Az Üzemanyag megadása kötelező!";
                return;
            }
            if (string.IsNullOrWhiteSpace(auto.Motor))
            {
                notificationMessage = "A Motor megadása kötelező!";
                return;
            }
            // Mentés az adatbázisba

            /*
            _appDbContext.autok.Add(auto);
            await _appDbContext.SaveChangesAsync();
            _appDbContext.autoTulajok.Add(autoTulaj);
            await _appDbContext.SaveChangesAsync();
            */
            // Értesítés a sikeres mentésről

            notificationMessage = "Sikeres adatfelvitel";
            messageColor = "color:black;";
        }
    }
}
