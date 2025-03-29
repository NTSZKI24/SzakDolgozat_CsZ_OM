using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;
namespace SzakDolgozat.SQL.Models
{
    public class Szerelo_Munka_View
    {
        [Required]
        public string TitkarNev { get; set; }

        [Required]
        public string SzereloNev { get; set; }

        public string Leiras { get; set; }
        [Required]
        public string Marka { get; set; }
        [Required]
        public string Tipus { get; set; }
        [Required]
        public string Uzemanyag { get; set; }
        [Required]
        public string Motor { get; set; }
        [Required]
        public string AlvazSzam { get; set; }
        [Required]
        public string Rendszam { get; set; }
        [Required]
        public long Osszkoltseg { get; set; }
        [Required]
        public required StatuszEnum Statusz { get; set; }

    }
}
