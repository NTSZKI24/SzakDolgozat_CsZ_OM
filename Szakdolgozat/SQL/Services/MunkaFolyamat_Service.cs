using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.SQL.Services
{
    public class MunkaFolyamat_Service : IMunkaFolyamat
    {
        private readonly AppDbContext _context;

        public MunkaFolyamat_Service(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<MunkaFolyamat>> GetMunkaFolyamatok()
        {
            return await _context.munkaFolyamatok.ToListAsync();
        }

        public async Task<MunkaFolyamat> GetMunkaFolyamat(Guid Id)
        {
            var munkaFolyamat = await _context.munkaFolyamatok.FindAsync(Id);
            if (munkaFolyamat == null)
            {
                throw new Exception("MunkaFolyamat not found");
            }
            return munkaFolyamat;
        }

        public async Task AddMunkaFolyamat(MunkaFolyamat munkaFolyamat)
        {
            _context.munkaFolyamatok.Add(munkaFolyamat);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateMunkaFolyamat(MunkaFolyamat munkaFolyamat)
        {
            _context.Entry(munkaFolyamat).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteMunkaFolyamat(Guid Id)
        {
            var munkaFolyamat = await _context.munkaFolyamatok.FindAsync(Id);
            if (munkaFolyamat != null)
            {
                _context.munkaFolyamatok.Remove(munkaFolyamat);
                await _context.SaveChangesAsync();
            }
        }
    }
}
