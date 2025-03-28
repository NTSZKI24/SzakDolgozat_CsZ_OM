using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    public class Admin_munkalapok_View
    {

        [Required]
        public required string TulajNev { get; set; }
        [Required]
        public required string SzereloNev { get; set; }
        [Required]
        public required string TitkarNev { get; set; }

        [Required]
        public required string Rendszam { get; set; }

        [Required]
        public required string Tipus { get; set; }

        [Required]
        public required string Marka { get; set; }

        [Required]
        public required string Uzemanyag { get; set; }

        [Required]
        public required string Motor { get; set; }

        [Required]
        public required string AlvazSzam { get; set; }

        [Required]
        public required string Osszkoltseg { get; set; }

        [Required]
        public required DateTime MunkaKezdete { get; set; }

        [Required]
        public required int MunkaIdo { get; set; }

        [Required]
        public required DateTime Keltezes { get; set; }
        [Required]
        public required StatuszEnum Statusz { get; set; }
    }
}
