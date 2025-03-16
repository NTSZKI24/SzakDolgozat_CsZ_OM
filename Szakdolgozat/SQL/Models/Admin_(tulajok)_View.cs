using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL.Models
{
    public class Admin__tulajok__View
    {

        [Required]
        public required string AutoTulaj { get; set; }

        [Required]
        public required string Telefonszam { get; set; }

        [Required]
        public required string Email { get; set; }

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
        public required string Leiras { get; set; }
    }
}
