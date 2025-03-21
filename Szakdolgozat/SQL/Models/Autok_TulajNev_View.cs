using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL.Models
{
    public class Autok_TulajNev_View
    {

        [Required]
        public required string Nev { get; set; }

        [Required]
        public required string Email { get; set; }

        [Required]
        public required string Telefonszam { get; set; }

        [Required]
        public required string AlvazSzam { get; set; }

        [Required]
        public required string Marka { get; set; }

        [Required]
        public required string Rendszam { get; set; }

        [Required]
        public required string Tipus { get; set; }

        [Required]
        public required string Uzemanyag { get; set; }
        [Required]
        public required string Motor { get; set; }
        [Required]
        public required string Leiras { get; set; }
        [Required]
        public required string Statusz { get; set; }
    }
}
