using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EFCorePractice
{
    class Program
    {
        static void Main(string[] args)
        {
            SimpleWineQueries();
            //SimpleExpenseQueries();
        }

        static void SimpleExpenseQueries()
        {
            using (var expensesDb = new ExpensesDbContext())
            {
                //var employees = expensesDb.Employees.ToList();
                //foreach (Employees emp in employees)
                //{
                //    expensesDb.Entry(emp).Collection(e => e.ExpenseReports).Load();
                //    Console.WriteLine($"{emp.Name} has {emp.ExpenseReports.Count()} expense reports");
                //}

                List<Employees> empExpenseReports = expensesDb.Employees
                    .Include(report => report.ExpenseReports)
                    .ToList();

                foreach (Employees emp in empExpenseReports)
                {
                    Console.WriteLine(emp.Name);
                    foreach (ExpenseReports report in emp.ExpenseReports)
                    {
                        Console.WriteLine(report.Purpose);
                    }
                }
            }
        }

        static void SimpleWineQueries()
        {
            using (var winesDb = new WinesDbContext())
            {
                //var wines1 = winesDb.Wine.ToList();
                //foreach (Wine wine in wines1)
                //{
                //    Console.WriteLine($"{wine.WineryId} {wine.Name}");
                //}

                //var wines2 = from wine in winesDb.Set<Wine>()
                //             join winery in winesDb.Set<Winery>()
                //             on wine.WineryId equals winery.Id
                //             select new { winery, wine };
                //foreach (var wine in wines2)
                //{
                //    Console.WriteLine($"{wine.winery.Name} {wine.wine.Vintage} {wine.wine.Name}");
                //}


                //var wines3 = winesDb.WinesByLocationFull.FromSqlRaw(
                //    "Select wine.StorageLocation1, wine.StorageLocation2, Winery=winery.Name, wine.Vintage, " +
                //    "Varietal = varietal.Name, wine.Name, wine.Price from rogreenwines.Wine as wine " +
                //    "Inner Join rogreenWines.Winery as winery " +
                //    "On winery.Id = wine.wineryId " +
                //    "Join rogreenWines.Varietal as varietal " +
                //    "On varietal.Id = wine.VarietalId " +
                //    "Order by StorageLocation1, StorageLocation2").AsNoTracking().ToList();

                //foreach (var wine in wines3)
                //{
                //    Console.WriteLine($"{wine.Vintage} {wine.Winery} {wine.Name} {wine.Varietal}");
                //}

                var wineries = winesDb.Winery.ToList();
                foreach (Winery winery in wineries)
                {
                    winesDb.Entry(winery).Collection(w => w.Wines).Load();
                    Console.WriteLine($"{winery.Name} has {winery.Wines.Count()} wines");
                }

                //List<AzureWinery> wines4 = winesDb.Winery
                //    .Include(winery => winery.Wines)
                //    .ToList();
                ////.Where(winery => winery.Name.Contains("DeLille"))

                //var wines5 = winesDb.Winery.FromSqlRaw(
                //    "Select * from [rogreenwines].Winery as winery " +
                //    "Join [rogreenwines].Wine as wine " +
                //    "On winery.Id = wine.WineryId").ToList();

                //foreach (Winery winery in wines4)
                //{
                //    Console.WriteLine(winery.Name);
                //    foreach (Wine wine in winery.Wines)
                //    {
                //        Console.WriteLine(wine.Varietal);
                //    }
                //}

                //wines = winesDb.Wine.OrderBy(w => w.Winery).ToList();
            }
        }
    }
}
