using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL
{
    [Table("Autok")]
    public class Auto
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

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

    }
}
