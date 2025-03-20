using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SzakDolgozat.SQL.Models
{
    [Table("Rolek")]
    public class Role
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public string RoleNev { get; set; }
    }
}
