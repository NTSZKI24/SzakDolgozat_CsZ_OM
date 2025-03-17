using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Models
{
    [Table("Autok")]
    public class Auto
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public string Marka { get; set; }

        [Required]
        public string Rendszam { get; set; }

        [Required]
        public string Tipus { get; set; }

        [Required]
        public string Uzemanyag { get; set; }

        [Required]
        public string Motor { get; set; }

        [Required]
        public string AlvazSzam { get; set; }

    }
}
