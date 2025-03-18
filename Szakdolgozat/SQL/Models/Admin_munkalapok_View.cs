using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL.Models
{
    public class Admin_munkalapok_View
    {

        [Required]
        public required string AutoTulaj { get; set; }

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
        public required string AlvazSzam { get; set; }

        [Required]
        public required string SzereloNev { get; set; }

        [Required]
        public required string TitkarNev { get; set; }

        [Required]
        public required long Osszkoltseg { get; set; }

        [Required]
        public required DateTime MunkaKezdete { get; set; }

        [Required]
        public required int MunkaIdo { get; set; }

        [Required]
        public required DateTime Keltezes { get; set; }
    }
}
