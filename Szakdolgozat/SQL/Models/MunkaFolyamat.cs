using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Models
{
    [Table("MunkaFolyamatok")]

    public class MunkaFolyamat
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public Guid MunkaID { get; set; }

        [Required]
        public string Folyamat { get; set; }

        [Required]
        public long Koltseg { get; set; }

    }
}
