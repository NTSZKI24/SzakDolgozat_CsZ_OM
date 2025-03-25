using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL.Models
{
    public class Titkar_Munkalapok_View
    {
        [Required]
        public required string SzereloNev { get; set; }
        [Required]
        public required string TulajNev { get; set; }
        [Required]
        public required string Telefonszam { get; set; }
        [Required]
        public required string Email { get; set; }
        [Required]
        public required int Statusz { get; set; }
        [Required]
        public required string AlvazSzam { get; set; }
        [Required]
        public required string Rendszam { get; set; }
        [Required]
        public required string Marka { get; set; }
        [Required]
        public required string MunkaKezdete { get; set; }
        [Required]
        public required string MunkaIdo { get; set; }
        [Required]
        public required string Keltezes { get; set; }
        [Required]
        public required string Osszkoltseg { get; set; }
        [Required]
        public required string TitkarNev { get; set; }
    }
}
