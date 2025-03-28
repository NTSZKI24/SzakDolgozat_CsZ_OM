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
        
        public DateTime MunkaKezdete { get; set; }
        [Required]
        public required int MunkaIdo { get; set; } = 0;
        
        public  DateTime Keltezes { get; set; }

        public  long Osszkoltseg { get; set; } = 0;
        [Required]
        public required string TitkarNev { get; set; }
    }
}
