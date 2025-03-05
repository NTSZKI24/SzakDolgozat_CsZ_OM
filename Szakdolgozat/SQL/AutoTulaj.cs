using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace SzakDolgozat.SQL
{
    [Table("AutoTulajok")]
    public class AutoTulaj
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public required string Telefonszam { get; set; }


        [Required]
        public required string Nev { get; set; }

        [Required]
        public required string Leiras { get; set; }

        [Required]
        public required string Email { get; set; }

        [Required]
        public required Guid AutoID { get; set; }

    }
}
