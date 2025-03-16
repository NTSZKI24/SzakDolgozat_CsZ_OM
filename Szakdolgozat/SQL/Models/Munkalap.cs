using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Models
{
    [Table("Munkalapok")]
    public class Munkalap
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public Guid AutoTulajID { get; set; }

        [Required]
        public Guid AutoID { get; set; }

        [Required]
        public DateTime MunkaKezdete { get; set; }

        [Required]
        public int MunkaIdo { get; set; }

        [Required]
        public DateTime Keltezes { get; set; }

    }
}
