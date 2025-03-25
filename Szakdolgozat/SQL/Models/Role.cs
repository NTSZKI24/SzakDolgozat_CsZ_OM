using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    [Table("Rolek")]
    public class Role
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public RoleEnum RoleNev { get; set; }
    }
}
