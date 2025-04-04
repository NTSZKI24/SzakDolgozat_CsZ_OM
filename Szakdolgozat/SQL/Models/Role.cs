using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    [Table("Rolek")]
    public class Role
    {
        [Key]
        public Guid ID { get; set; }

        [Required]
        public string RoleNev { get; set; }
    }
}
