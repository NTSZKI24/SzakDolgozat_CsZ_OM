using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Models
{
    public class Titkar_SzereloDropDown_View
    {
        [Required]
        public string SzereloNev { get; set; }

        public string TitkarNev { get; set; }

        [Required]
        public StatuszEnum Statusz { get; set; }

        public string RoleNev { get; set; }

        public string DisplayText => $"{SzereloNev} - {Statusz}";
    }
}
