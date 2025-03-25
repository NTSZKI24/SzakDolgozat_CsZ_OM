using Microsoft.EntityFrameworkCore;
using SzakDolgozat.SQL.Services;

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
            modelBuilder.Entity<Admin_tulajok_View>().ToView("Admin_tulajok_View").HasNoKey();
            modelBuilder.Entity<Titkar_Munkalapok_View>().ToView("Titkar_Munkalapok_View").HasNoKey();
            modelBuilder.Entity<Szerelo_Munka_View>().ToView("Szerelo_Munka_View").HasNoKey();
            modelBuilder.Entity<Titkar_SzereloDropDown_View>().ToView("Titkar_SzereloDropDown_View").HasNoKey();
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
        public DbSet<Titkar_Munkalapok_View> titkar_Munkalapok_Viewes { get; set; }
        public DbSet<Szerelo_Munka_View> szerelo_Munka_Viewes { get; set; }
        public DbSet<Titkar_SzereloDropDown_View> titkar_SzereloDropDown_Viewes { get; set; }

    }
}
