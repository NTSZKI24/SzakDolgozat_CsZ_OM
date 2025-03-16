using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Models
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


        public Guid RoleID { get; set; }


    }
}
