using Microsoft.AspNetCore.Components;
using Microsoft.IdentityModel.Tokens;
using Radzen.Blazor;
using Radzen;
using SzakDolgozat.SQL.Classes;
using SzakDolgozat.SQL.Interfaces;

namespace SzakDolgozat.Components.Pages
{
    public partial class Started
    {
        [Injcect]
        public AppDbContext _appDbContext { get; set; }

        [Injcect]
        public IAuto Auto_Service { get; set; }

        [Injcect]
        public NavigationManager Navigation { get; set; }


        RadzenDataGrid<Auto> grid;
        int count;
        IEnumerable<Auto> autok;
        bool isLoading = false;

        List<string> titles = new List<string> { "Sales Representative", "Vice President, Sales", "Sales Manager", "Inside Sales Coordinator" };
        IEnumerable<string> selectedTitles;

        async Task OnSelectedTitlesChange(object value)
        {
            if (selectedTitles != null && !selectedTitles.Any())
            {
                selectedTitles = null;
            }

            await grid.FirstPage();
        }

        async Task Reset()
        {
            grid.Reset(true);
            await grid.FirstPage(true);
        }

        async Task LoadData(LoadDataArgs args)
        {
            isLoading = true;

            await Task.Yield();

            var query = _appDbContext.autok.AsQueryable();

            if (!string.IsNullOrEmpty(args.Filter))
            {
                // Filter via the Where method
                query = query.Where(grid.ColumnsCollection);
            }

            if (!string.IsNullOrEmpty(args.OrderBy))
            {
                // Sort via the OrderBy method
                query = query.OrderBy(args.OrderBy);
            }

            // Important!!! Make sure the Count property of RadzenDataGrid is set.
            count = query.Count();

            // Perform paging via Skip and Take.
            autok = query.Skip(args.Skip.Value).Take(args.Top.Value).ToList();

            isLoading = false;
        }

        public async Task LoadData()
        {
            autok = await Auto_Service.GetAutok();
        }
    }

    internal class InjcectAttribute : Attribute
    {
    }
}

