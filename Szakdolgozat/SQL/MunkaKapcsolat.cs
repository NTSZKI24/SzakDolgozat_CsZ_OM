using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL
{
    [Table("MunkaKapcsolatok")]
    public class MunkaKapcsolat
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public Guid TitkarID { get; set; }

        [Required]
        public Guid SzereloID { get; set; }

        [Required]
        public Guid MunkaID { get; set; }
    }
}
