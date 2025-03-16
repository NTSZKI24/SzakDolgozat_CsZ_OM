using Microsoft.EntityFrameworkCore;
using Radzen.Blazor.Rendering;

namespace SzakDolgozat.SQL.Models
{
    public class SQL : DbContext
    {
        public static string ConnectionString { get; set; }

        private SQL(DbContextOptions o) : base(o)
        { }

        public static SQL Init()
        {
            var options = new DbContextOptionsBuilder().UseSqlServer(ConnectionString);
            return new SQL(options.Options);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin__felhasznalok__View>().ToView("Admin_(/felhasznalok)_View").HasNoKey();
            modelBuilder.Entity<Admin__munkalapok__View>().ToView("Admin_(/munkalapok_View)").HasNoKey();
            modelBuilder.Entity<Admin__tulajok__View>().ToView("Admin_(/tulajok)_View");
            modelBuilder.Entity<Autok_TulajNev_View>().ToView("Autok_TulajNev_View");

            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Auto> autok { get; set; }
        public DbSet<AutoTulaj> autoTulajok { get; set; }
        public DbSet<Felhasznalo> rolok { get; set; }
        public DbSet<MunkaFolyamat> munkaFolyamatok { get; set; }
        public DbSet<MunkaKapcsolat> munkaKapcsolatok { get; set; }
        public DbSet<Munkalap> munkaLapok { get; set; }
        public DbSet<Role> roles { get; set; }


    }
}
