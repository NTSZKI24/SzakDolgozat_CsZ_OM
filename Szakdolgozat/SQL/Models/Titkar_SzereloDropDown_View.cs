using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    public class Titkar_SzereloDropDown_View
    {
        [Required]
        public string SzereloNev { get; set; }

        public string TitkarNev { get; set; }

        [Required]
        public StatuszEnum Statusz { get; set; }

        public RoleEnum RoleNev { get; set; }

    }
}
