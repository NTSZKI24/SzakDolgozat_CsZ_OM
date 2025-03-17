using Microsoft.EntityFrameworkCore;

namespace SzakDolgozat.SQL.Models
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin_felhasznalok_View>().ToView("Admin_felhasznalok_View").HasNoKey();
            modelBuilder.Entity<Admin_munkalapok_View>().ToView("Admin_munkalapok_View").HasNoKey();
            modelBuilder.Entity<Admin_tulajok_View>().ToView("Admin_tulajok_View");
            modelBuilder.Entity<Autok_TulajNev_View>().ToView("Autok_TulajNev_View");

            base.OnModelCreating(modelBuilder);
        }
        public DbSet<Auto> autok { get; set; }
        public DbSet<AutoTulaj> autoTulajok { get; set; }
        public DbSet<Felhasznalo> felhasznalok { get; set; }
        public DbSet<MunkaFolyamat> munkaFolyamatok { get; set; }
        public DbSet<MunkaKapcsolat> munkaKapcsolatok { get; set; }
        public DbSet<Munkalap> munkaLapok { get; set; }
        public DbSet<Role> rolok { get; set; }
        public DbSet<Admin_felhasznalok_View> admin_felhasznalok_Viewes { get; set; }
        public DbSet<Admin_munkalapok_View> admin_munkalapok_Viewes { get; set; }
        public DbSet<Admin_tulajok_View> admin_tulajok_Viewes { get; set; }
        public DbSet<Autok_TulajNev_View> autok_TulajNev_Viewes { get; set; }

    }
}
