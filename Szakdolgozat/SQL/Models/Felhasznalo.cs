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
        public string Felhasznalonev { get; set; }

        [Required]
        public string Nev { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Jelszo { get; set; }


        public Guid RoleID { get; set; }


    }
}
