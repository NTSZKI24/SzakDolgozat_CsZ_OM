using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;
namespace SzakDolgozat.SQL.Models
{
    public class Szerelo_Munka_View
    {
        [Required]
        public string SzereloNev { get; set; }

        [Required]
        public string TulajNev { get; set; }

        [Required]
        public string Telefonszam { get; set; }
        [Required]
        public string Email { get; set; }

        public StatuszEnum? Statusz { get; set; }

        [Required]
        public string AlvazSzam { get; set; }
        [Required]
        public string Rendszam { get; set; }
        [Required]
        public string Marka { get; set; }

        public DateTime? MunkaKezdete { get; set; }

        public int? MunkaIdo { get; set; }

        public DateTime? Keltezes { get; set; }

        [Required]
        public long Osszkoltseg { get; set; } = 0;

        [Required]
        public string TitkarNev { get; set; }

        public string? Leiras { get; set; }

        [Key]
        public Guid ID { get; set; }

    }
}
