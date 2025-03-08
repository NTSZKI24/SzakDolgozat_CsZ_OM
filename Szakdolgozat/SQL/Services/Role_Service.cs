using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class Role_Service : IRole
    {
        private readonly AppDbContext _context;

        public Role_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Role>> GetRolek()
        {
            return await _context.rolok.ToListAsync();
        }

        public async Task<Role> GetRole(Guid Id)
        {
            var role = await _context.rolok.FindAsync(Id);
            if (role == null)
            {
                throw new Exception("Role not found");
            }
            return role;
        }

        public async Task AddRole(Role role)
        {
            _context.rolok.Add(role);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateRole(Role role)
        {
            _context.Entry(role).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteRole(Guid Id)
        {
            var role = await _context.rolok.FindAsync(Id);
            if (role != null)
            {
                _context.rolok.Remove(role);
                await _context.SaveChangesAsync();
            }
        }
    }
}
