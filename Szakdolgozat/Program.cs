using Microsoft.EntityFrameworkCore;
using Radzen;
using SzakDolgozat.Components;
using SzakDolgozat.SQL.Models;
using SzakDolgozat.SQL.Interfaces;
using SzakDolgozat.SQL.Services;

namespace SzakDolgozat
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();
            builder.Services.AddRadzenComponents();
            builder.Services.AddDbContext<AppDbContext>(c =>
                c.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
            builder.Services.AddScoped<IAdmin_felhasznalok_View, Admin_felhasznalok_View_Service>();
            builder.Services.AddScoped<IAdmin_munkalapok_View, Admin_munkalapok_View_Service>();
            builder.Services.AddScoped<IAdmin_tulajok_View, Admin_tulajok_View_Service>();
            builder.Services.AddScoped<IAuto, Auto_Service>();
            builder.Services.AddScoped<IAutok_TulajNev_View, Autok_TulajNev_View_Service>();
            builder.Services.AddScoped<IAutoTulaj, AutoTulaj_Service>();
            builder.Services.AddScoped<IFelhasznalo, Felhasznalo_Service>();
            builder.Services.AddScoped<IMunkaFolyamat, MunkaFolyamat_Service>();
            builder.Services.AddScoped<IMunkaKapcsolat, MunkaKapcsolat_Service>();
            builder.Services.AddScoped<IMunkalap, Munkalap_Service>();
            builder.Services.AddScoped<IRole, Role_Service>();


            var app = builder.Build();


            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();
            app.UseAntiforgery();

            app.MapRazorComponents<App>()
                .AddInteractiveServerRenderMode();

            app.Run();
        }
    }
}
