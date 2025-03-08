using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Classes
{
    [Table("Felhasznalok")]
    public class Felhasznalo
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public required string Felhasznalonev { get; set; }

        [Required]
        public required string Nev { get; set; }

        [Required]
        public required string Email { get; set; }

        [Required]
        public required string Jelszo { get; set; }

        [Required]
        public required Guid RoleID { get; set; }
    }
}
