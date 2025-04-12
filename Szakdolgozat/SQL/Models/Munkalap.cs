using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    [Table("Munkalapok")]
    public class Munkalap
    {
        [Key]
        public Guid ID { get; set; } = Guid.NewGuid();

        [Required]
        public Guid AutoTulajID { get; set; }

        [Required]
        public Guid AutoID { get; set; }

        
        public StatuszEnum? Statusz { get; set; }

       
        public DateTime? MunkaKezdete { get; set; }

        
        public int? MunkaIdo { get; set; }

        
        public DateTime? Keltezes { get; set; }

        public bool? Befejezhetetlen { get; set; } = false;

    }
}
