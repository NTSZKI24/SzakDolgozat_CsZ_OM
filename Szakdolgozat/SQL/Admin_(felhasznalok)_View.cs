using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL
{
    public class Admin__felhasznalok__View
    {
        [Required]
        public required string Felhasznalonev { get; set; }

        [Required]
        public required string Nev { get; set; }

        [Required]
        public required string Email { get; set; }

        [Required]
        public required string Jelszo { get; set; }

        [Required]
        public required string RoleNev { get; set; }
    }
}
