﻿using System.ComponentModel.DataAnnotations;
using SzakDolgozat.SQL.Enum;

namespace SzakDolgozat.SQL.Models
{
    public class Admin_felhasznalok_View
    {
        [Required]
        public required string Felhasznalonev { get; set; }

        [Required]
        public required string Nev { get; set; }

        [Required]
        public required string Email { get; set; }

        [Required]
        public required string Jelszo { get; set; }

        [Required]
        public required string RoleNev { get; set; }

        [Required]
        public Guid ID { get; set; }
    }
}
