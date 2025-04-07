using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SzakDolgozat.SQL.Security
{
    public static class PasswordSecurity
    {
        private static string randomStr(int len = 10)
        {
            string chars = "qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM0123456789";
            string output = string.Empty;
            while (output.Length < len)
            {
                output += chars[new Random().Next(0, chars.Length - 1)];
            }
            return output;
        }

        public static string HashPassword(string password) => hashPassword(password);

        public static bool ValidatePassword(string password, string hash) => hash == hashPassword(password, hash.Split("$")[1]);
        /* {
             string salt = hash.Split("$")[1];
             string hash2 = hashPassword(password, salt);
             return hash == hash2;
         }*/

        private static string hashPassword(string password, string? salt = null)
        {
            if (string.IsNullOrEmpty(salt))
            {
                salt = randomStr();
            }
            password += salt;
            SHA384 sha = SHA384.Create();
            byte[] pwEncoded = Encoding.UTF8.GetBytes(password);
            byte[] pwBytes = sha.ComputeHash(pwEncoded);
            string pwHashed = Convert.ToBase64String(pwBytes);
            return $"{pwHashed}${salt}";
        }
    }
}
