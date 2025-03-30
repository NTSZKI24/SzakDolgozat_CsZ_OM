using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;

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
        public required StatuszEnum Statusz { get; set; }
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

        [Required]
        public required long Osszkoltseg { get; set; } = 0;

        public string TitkarNev { get; set; }


    }
}
