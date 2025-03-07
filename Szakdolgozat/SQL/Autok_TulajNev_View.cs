﻿using System.ComponentModel.DataAnnotations;

namespace SzakDolgozat.SQL
{
    public class Autok_TulajNev_View
    {

        [Required]
        public required string AlvazSzam { get; set; }

        [Required]
        public required string AutoTulaj { get; set; }

        [Required]
        public required string Marka { get; set; }

        [Required]
        public required string Rendszam { get; set; }

        [Required]
        public required string Tipus { get; set; }

        [Required]
        public required string Uzemanyag { get; set; }

        [Required]
        public required string Motor { get; set; }
    }
}
