using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Classes
{
    [Table("MunkaFolyamatok")]

    public class MunkaFolyamat
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public required Guid MunkaID { get; set; }

        [Required]
        public required string Folyamat { get; set; }

        [Required]
        public required long Koltseg { get; set; }
    }
}
