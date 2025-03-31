using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace SzakDolgozat.SQL.Models
{
    [Table("AutoTulajok")]
    public class AutoTulaj
    {
        [Key]
        public Guid ID { get; set; } = Guid.NewGuid();

        [Required]
        public string Telefonszam { get; set; }


        [Required]
        public string Nev { get; set; }

        public string? Leiras { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public Guid AutoID { get; set; }

    }
}
