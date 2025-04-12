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
        public long Osszkoltseg { get; set; } = 0;

        public DateTime? MunkaKezdete { get; set; }


        public  int? MunkaIdo { get; set; }


        public DateTime? Keltezes { get; set; }

        public StatuszEnum? Statusz { get; set; }

        public bool? Befejezhetetlen { get; set; } = false;

        [Required]
        public required Guid ID { get; set; }
    }
}
