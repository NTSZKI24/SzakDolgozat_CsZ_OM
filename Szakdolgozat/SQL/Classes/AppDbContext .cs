using Microsoft.EntityFrameworkCore;

namespace SzakDolgozat.SQL.Classes
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
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
        public DbSet<Admin__felhasznalok__View> Admin__felhasznalok__Viewes { get; set; }
        public DbSet<Admin__munkalapok__View> Admin__munkalapok__Viewes { get; set; }
        public DbSet<Admin__tulajok__View> Admin__tulajok__Viewes { get; set; }
        public DbSet<Autok_TulajNev_View> autok_TulajNev_Viewes { get; set; }

    }
}
